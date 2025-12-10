import 'package:task_manager/core/services/remote_database.dart';

class ProfileRemoteDataSource {
  late RemoteDbService remoteDbService;

  ProfileRemoteDataSource(this.remoteDbService);

  Future ensureProfileTable() async {
    await remoteDbService.supabaseClient.from('cities').insert({
      'name': 'The Shire',
      'country_id': 554,
    });
  }
}
