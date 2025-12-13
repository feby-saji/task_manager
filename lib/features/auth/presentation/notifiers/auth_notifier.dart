import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/auth/domain/usecases/auth_state_changes_usecase.dart';
import 'package:task_manager/features/auth/domain/usecases/login_guest_usecase.dart';

import '../../domain/entities/user_entity.dart';
import '../state/auth_state.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthStateR>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthStateR> {
  late final AuthStateChangesUseCase _authStateChangesUseCase;
  late final SignInAnonymousUseCase _signInAnonymousUseCase;
  StreamSubscription<AuthUser?>? _subscription;

  @override
  AuthStateR build() {
    _authStateChangesUseCase = ref.watch(authStateChangesUseCaseProvider);
    _signInAnonymousUseCase = ref.read(signInAnonymousUseCaseProvider);
    _subscription = _authStateChangesUseCase().listen(listenToAuthChanges);
    ref.onDispose(() {
      _subscription?.cancel();
    });
    return InitialAuthState();
  }

  listenToAuthChanges(AuthUser? user) {
    if (user == null) {
      state = UnAuthenticatedState();
    } else {
      state = AuthenticatedState(user);
    }
  }

  Future<void> signInAnonymous() async {
    state = const LoadingAuthState();
    final result = await _signInAnonymousUseCase().run();
    result.fold(
      (failure) => state = UnAuthenticatedState(),
      (user) => state = AuthenticatedState(user),
    );
  }
}
