import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid, // Supabase UID
    String? name,
    String? email,
    required DateTime lastSyncedTime,
    required ThemeMode themeMode,
    @Default('en') String preferredLanguageCode, // e.g., 'en', 'es', 'fr'
  }) = _UserProfile;
}
