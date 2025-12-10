import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<RemoteDbService> remoteDbProvider = Provider<RemoteDbService>(
  (ref) => RemoteDbService(),
);

class RemoteDbService {
  SupabaseClient get supabaseClient => Supabase.instance.client;
}
