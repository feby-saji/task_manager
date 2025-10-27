

abstract class AuthRepository {
  // if guest user exist migrate the primary key of user table,  userId from tasks table in local DB
  Future<String> signInUsingGoole();
  Future<String> signInAsGuest(); // return hardcoded 'local_guest'
  Future<void> signOut();

  Future<String> getUserUid(); 
  Future<String> getUserName(); 

  Future<bool> userLoggedIn(); 
  
}
