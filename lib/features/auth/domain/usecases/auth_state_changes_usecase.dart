import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart';
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

final authStateChangesUseCaseProvider = Provider<AuthStateChangesUseCase>((
  ref,
) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthStateChangesUseCase(authRepository);
});

class AuthStateChangesUseCase {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);

  Stream<AuthUser?> call() {
    return _authRepository.authStateChanges();
  }
}
