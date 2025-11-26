import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id, // Supabase UID or local_guest
    String? name,
    String? email,
    required DateTime lastSyncedTime,
    required bool isGuest,
    required ThemeMode themeMode,
    @Default('en') String preferredLanguageCode, // e.g., 'en', 'es', 'fr'
  }) = _UserProfile;
}
