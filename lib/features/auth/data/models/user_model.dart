import 'package:task_manager/core/utils/enums.dart';
import 'package:task_manager/core/utils/extensions.dart';
import 'package:task_manager/features/auth/domain/entities/user_entity.dart';

class AuthUserModel {
  final String userId;
  final String authProvider;

  AuthUserModel({required this.userId, required this.authProvider});

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      userId: map['user_id'],
      authProvider: map['authProvider'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'user_id': userId, 'provider': authProvider};
  }

  // Convert model -> domain entity
  AuthUser toDomain() {
    return AuthUser(
      userId: userId,
      authProvider: EnumDbExt.fromDb(AuthProvider.values, authProvider),
    );
  }
}
