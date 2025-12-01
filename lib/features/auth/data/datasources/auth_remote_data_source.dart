import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/local_database.dart';

class AuthRemoteDataSource {
  late Provider<LocalDatabaseService> localDbService;

  AuthRemoteDataSource(localDbService);


}