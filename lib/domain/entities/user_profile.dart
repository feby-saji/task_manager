import 'package:flutter/material.dart';

class UserProfile {
  final String id; // Supabase UID or local_guest
  final String? name;
  final String? email;
  final DateTime lastSyncedTime;
  final bool isGuest;
  final ThemeMode themeMode;

  final String preferredLanguageCode; // e.g., 'en', 'es', 'fr'
  UserProfile({
    required this.id,
    required this.themeMode,
    required this.isGuest,
    required this.lastSyncedTime,
    this.preferredLanguageCode = 'en',
    this.name,
    this.email,
  });
}
