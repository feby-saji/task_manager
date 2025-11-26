import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String uuid, // for guest user -> local_guest else Supabase UUID
    required String email,
  }) = _AuthUser;
}