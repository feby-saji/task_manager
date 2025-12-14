import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/features/auth/presentation/notifiers/providers.dart';

import '../../../../core/router/app_routes.dart';
import '../../domain/usecases/signin_anonymous_usecase.dart';
import '../state/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> implements Listenable {
  late final SignInAnonymousUseCase _signInAnonymousUseCase;

  VoidCallback? _routerListener;

  @override
  AuthState build() {
    _signInAnonymousUseCase = ref.read(signInAnonymousUseCaseProvider);

    ref.listen(userAuthChangesStreamProvider, (previous, next) {
      if (next.hasValue) {
        if (next.value == null) {
          state = AuthStateUnauthenticated('User is Null');
          _routerListener?.call();
        } else {
          state = AuthStateAuthenticated(next.value!);
          _routerListener?.call();
        }
      } else if (next.hasError) {
        state = AuthStateUnauthenticated(next.error.toString());
        _routerListener?.call();
      } else if (next.isLoading) {
        state = const AuthStateAuthenticating();
        _routerListener?.call();
      }
    });

    return AuthStateInitial();
  }

  String? authRedirect(GoRouterState goRouterState) {
    final bool isLoggedIn = state is AuthStateAuthenticated;

    final String currentPath = goRouterState.uri.path;

    final bool onLoginPage = currentPath == AppRoutes.login;
    // final bool onMainPage = currentPath == AppRoutes.main;

    if (!isLoggedIn && !onLoginPage) {
      return AppRoutes.login;
    }

    if (isLoggedIn && onLoginPage) {
      return AppRoutes.main;
    }

    return null;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }

  Future<void> signInAnonymous() async {
    state = const AuthStateAuthenticating();
    final result = await _signInAnonymousUseCase().run();
    //   no need to handle states as the go router redirects through userAuthChangesStreamProvider
  }
}
