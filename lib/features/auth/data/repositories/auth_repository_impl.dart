import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_manager/core/utils/enums.dart';
import 'package:task_manager/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:task_manager/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart'
    as entity;
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/utils/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  @override
  TaskEither<Failure, entity.AuthUser> signInAnonymous() {
    return TaskEither.tryCatch(() async {
      final AuthResponse authResponse = await authRemoteDataSource
          .signInAnonymously();
      final Session? session = authResponse.session;

      if (session == null) {
        throw InvalidSessionFailure('Session is null');
      }

      return entity.AuthUser(
        userId: session,
        authProvider: _mapProvider(session),
      );
    }, (err, _) => _mapError(err));
  }

  @override
  TaskEither<Failure, entity.AuthUser> signInUsingGoogle() {
    // TODO: implement signInUsingGoogle
    throw UnimplementedError();
  }

  @override
  TaskEither<Failure, void> signOut() {
    // TODO: implement signInUsingGoogle
    throw UnimplementedError();
    // authLocalDataSource.clearAllData();
  }

  @override
  Stream<entity.AuthUser?> authStateChanges() {
    return Supabase.instance.client.auth.onAuthStateChange.map((data) {
      final session = data.session;

      if (session == null) return null;

      return entity.AuthUser(
        userId: session.user.id,
        authProvider: _mapProvider(session),
      );
    });
  }

  AuthProvider _mapProvider(Session session) {
    if (session.user.isAnonymous) {
      return AuthProvider.anonymous;
    }

    final identities = session.user.identities;
    final provider = identities?.last.provider;

    switch (provider) {
      case 'email':
        return AuthProvider.email;
      case 'google':
        return AuthProvider.google;
      default:
        return AuthProvider.unknown;
    }
  }

  Failure _mapError(Object error) {
    if (error is AuthException) {
      return AuthServerFailure(error.toString());
    } else if (error is SocketException) {
      return NetworkFailure();
    } else if (error is PostgrestException) {
      return SupabasePermissionFailure(
        'PostgrestException in supabase. eg: table RLS, access denied',
      );
    } else {
      return UnknownFailure(error.toString());
    }
  }
}
