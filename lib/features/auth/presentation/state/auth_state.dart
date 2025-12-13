import 'package:task_manager/features/auth/domain/entities/user_entity.dart';

sealed class AuthStateR {
  const AuthStateR();
}

class InitialAuthState extends AuthStateR {
  const InitialAuthState();
}

class LoadingAuthState extends AuthStateR {
  const LoadingAuthState();
}

class AuthenticatedState extends AuthStateR {
  AuthUser user;

  AuthenticatedState(this.user);
}

class UnAuthenticatedState extends AuthStateR {
  const UnAuthenticatedState();
}
