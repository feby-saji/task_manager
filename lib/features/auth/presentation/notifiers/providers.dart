import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_state_changes_usecase.dart';
import '../../domain/usecases/signin_anonymous_usecase.dart';
import '../state/auth_state.dart';
import 'auth_notifier.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

// USE CASES
final signInAnonymousUseCaseProvider = Provider<SignInAnonymousUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInAnonymousUseCase(authRepository);
});

final authStateChangesUseCaseProvider = Provider<AuthStateChangesUseCase>((
  ref,
) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthStateChangesUseCase(authRepository);
});

final userAuthChangesStreamProvider = StreamProvider<AuthUser?>((ref) {
  return ref.read(authStateChangesUseCaseProvider)();
});
