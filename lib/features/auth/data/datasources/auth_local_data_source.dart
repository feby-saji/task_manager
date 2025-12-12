import '../../../../core/services/local_database.dart';
import '../../../../core/utils/enums.dart';

class AuthLocalDataSource {
  late LocalDatabaseService localDbService;

  AuthLocalDataSource(this.localDbService);

  Future clearAllData() async {
    // called at end of signOut method
    final db = await localDbService.database;
    await db.transaction((txn) async {
      await txn.delete(Tables.profile.name);
      await txn.delete(Tables.tasks.name);
      await txn.delete(Tables.attachments.name);
      await txn.delete(Tables.pendingOperations.name);
    });
  }
}
