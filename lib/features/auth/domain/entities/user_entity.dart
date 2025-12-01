import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required userId,
    required AuthProvider authProvider,
  }) = _AuthUser;
}
