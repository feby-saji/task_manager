import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart';
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/utils/failures.dart';

final signInAnonymousUseCaseProvider = Provider<SignInAnonymousUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInAnonymousUseCase(authRepository);
});

class SignInAnonymousUseCase {
  final AuthRepository _authRepository;

  SignInAnonymousUseCase(this._authRepository);

  TaskEither<Failure, AuthUser> call() {
    return _authRepository.signInAnonymous();
  }
}
