import 'package:flutter/material.dart';

enum TaskPriority {
  low('Low', Colors.green),
  medium('Medium', Colors.orange),
  high('High', Colors.red);

  final String label;
  final Color color;

  const TaskPriority(this.label, this.color);
}

enum SyncPendingOps { none, create, update, delete }

enum AttachmentType { image, pdf, other }
