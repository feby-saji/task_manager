import 'package:flutter/material.dart';

enum AuthProvider {
  google('google'),
  apple('apple'),
  anonymous('anonymous'),
  email('email'),
  unknown('unknown');

  final String label;

  const AuthProvider(this.label);
}

enum TaskPriority {
  low('Low', Colors.green),
  medium('Medium', Colors.orange),
  high('High', Colors.red);

  final String label;
  final Color color;

  const TaskPriority(this.label, this.color);
}

enum SyncPendingOps {
  none('None'),
  create('Create'),
  update('Update'),
  delete('Delete');

  final String label;

  const SyncPendingOps(this.label);
}

enum AttachmentType {
  image('Image'),
  pdf('PDF'),
  other('Other');

  final String label;

  const AttachmentType(this.label);
}

enum ThemeModeDb {
  light('Light'),
  dark('Dark'),
  system('System');

  final String label;

  const ThemeModeDb(this.label);
}

enum LanguagePref {
  enUS('English (US)'),
  hiIN('Hindi (IN)');

  final String label;

  const LanguagePref(this.label);
}

enum EntityType {
  task('Task'),
  attachment('Attachment'),
  profile('Profile');

  final String label;

  const EntityType(this.label);
}

enum PendingStatus {
  pending('Pending'),
  success('Success'),
  failed('Failed');

  final String label;

  const PendingStatus(this.label);
}

enum SnackBarType { success, error, info }

enum Tables { tasks, attachments, profile, pendingOperations }
