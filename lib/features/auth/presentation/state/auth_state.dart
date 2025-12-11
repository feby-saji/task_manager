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

class AuthSuccessState extends AuthStateR {
  AuthUser user;

  AuthSuccessState(this.user);
}

class AuthFailureState extends AuthStateR {
  const AuthFailureState();
}
