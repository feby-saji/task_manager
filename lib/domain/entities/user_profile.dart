import 'package:flutter/material.dart';

class UserProfile {
  final String id; // Supabase UID or local_guest
  final String? name;
  final String? email;
  final DateTime lastSync;
  final bool isGuest;
  final ThemeMode themeMode;

  UserProfile({
    required this.id,
    required this.themeMode,
    required this.isGuest,
    required this.lastSync,
    this.name,
    this.email,
  });
}
