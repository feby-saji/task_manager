sealed class AuthState {
  const AuthState();
}

class InitialAuthState extends AuthState {
  const InitialAuthState();
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState();
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState();
}

class AuthFailureState extends AuthState {
  const AuthFailureState();
}
