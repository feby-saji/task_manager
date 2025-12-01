

abstract class AuthRepository {
  Future<String> signInUsingGoogle();
  Future<String> signInAsGuest();
  Future<void> signOut();

  Future<String> getUserUid();
  Future<bool> userLoggedInStatus();
  
}
