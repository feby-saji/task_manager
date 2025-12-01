import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/failures.dart';
import 'package:task_manager/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart';
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  @override
  Future<String> getUserUid() {
    // if authenticated get from supabase
    // TODO: implement getUserUid
    throw UnimplementedError();
    // else return null
  }

  @override
  Future<Either<AuthFailure, AuthUser>> signInAsGuest() {
    // TODO: implement signInAsGuest
    throw UnimplementedError();
  }

  @override
  Future<String> signInUsingGoogle() {
    // TODO: implement signInUsingGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await authLocalDataSource.clearAllData();
  }

  @override
  Future<bool> userLoggedInStatus() {
    // TODO: implement userLoggedInStatus
    throw UnimplementedError();
  }
}
