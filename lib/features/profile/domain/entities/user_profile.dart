import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  factory UserProfile({
    required String userId,
    required String? displayName,
    required String? email,
    required String? photoUrl,
    @Default('en') String preferredLanguageCode, // e.g., 'en', 'es', 'fr'
    required ThemeMode themeMode,
    required String? lastSync,
  }) = _UserProfile;
}
