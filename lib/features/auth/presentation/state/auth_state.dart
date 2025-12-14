import 'package:task_manager/features/auth/domain/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class AuthStateAuthenticating extends AuthState {
  const AuthStateAuthenticating();
}

class AuthStateAuthenticated extends AuthState {
  AuthUser user;

  AuthStateAuthenticated(this.user);
}

class AuthStateUnauthenticated extends AuthState {
  final String errMsg;

  const AuthStateUnauthenticated(this.errMsg);
}
