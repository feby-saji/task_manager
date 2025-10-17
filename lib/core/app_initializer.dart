import 'package:flutter/material.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // // local DB
    // await Hive.initFlutter();

    // // Supabase
    // await Supabase.initialize(
    //   url: 'YOUR_SUPABASE_URL',
    //   anonKey: 'YOUR_SUPABASE_ANON_KEY',
    // );

    // Firebase (if needed)
    // await Firebase.initializeApp();

    // Any other plugin
  }
}
