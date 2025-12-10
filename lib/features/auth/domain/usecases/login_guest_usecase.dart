import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_manager/core/failures.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart';
import 'package:task_manager/features/auth/domain/repositories/auth_repository.dart';

final loginGuestUseCaseProvider = Provider<LoginGuestUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LoginGuestUseCase(authRepository);
});

class LoginGuestUseCase {
  final AuthRepository _authRepository;

  LoginGuestUseCase(this._authRepository);

  TaskEither<Failure, AuthUser> call() {
    return _authRepository.signInAnonymous();
  }
}
