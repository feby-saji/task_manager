import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/services/remote_database.dart';
import 'package:task_manager/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:task_manager/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:task_manager/features/auth/data/repositories/auth_repository_impl.dart';

import '../../../../core/services/local_database.dart';
import '../../../../core/utils/failures.dart';
import '../entities/user_entity.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final localDbService = ref.read(localDbProvider);
  final remoteDbService = ref.read(remoteDbProvider);

  AuthLocalDataSource localDataSource = AuthLocalDataSource(localDbService);
  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource(
    remoteDbService,
  );

  return AuthRepositoryImpl(
    authLocalDataSource: localDataSource,
    authRemoteDataSource: authRemoteDataSource,
  );
});

abstract class AuthRepository {
  TaskEither<Failure, AuthUser> signInUsingGoogle();

  TaskEither<Failure, AuthUser> signInAnonymous();

  TaskEither<Failure, void> signOut();

  Stream<AuthUser?> authStateChanges();
}
