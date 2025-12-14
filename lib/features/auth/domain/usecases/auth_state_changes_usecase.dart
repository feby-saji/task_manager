import 'dart:async';

import 'package:task_manager/features/auth/domain/entities/user_entity.dart';
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

class AuthStateChangesUseCase {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);

  Stream<AuthUser?> call() {
    return _authRepository.authStateChanges();
  }
}
