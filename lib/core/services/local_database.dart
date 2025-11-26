
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDbProvider = Provider<LocalDbService>((_){
  return LocalDbService();
});

class LocalDbService {
  getThemeMode<ThemeMode>() {

  }

  saveThemeMode(ThemeMode themeMode) {

  }
}