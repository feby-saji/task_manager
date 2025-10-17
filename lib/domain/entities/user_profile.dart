import 'package:flutter/material.dart';

class UserProfile {
  final String id; // Supabase UID or local_guest
  final String? name;
  final String? email;
  final DateTime lastsyncedTime;
  final bool isGuest;
  final ThemeMode themeMode;

  UserProfile({
    required this.id,
    required this.themeMode,
    required this.isGuest,
    required this.lastsyncedTime,
    this.name,
    this.email,
  });
}
