import 'package:task_manager/core/services/remote_database.dart';

class AuthRemoteDataSource {
  late RemoteDbService remoteDbService;

  AuthRemoteDataSource(this.remoteDbService);

  Future signInAnonymously() async {
    return await remoteDbService.supabaseClient.auth.signInAnonymously();
  }
}
