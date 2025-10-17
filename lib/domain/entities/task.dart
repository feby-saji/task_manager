import 'package:task_manager/core/enums.dart';
import 'package:task_manager/domain/entities/attachments.dart';

class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final TaskPriority priority;
  final List<Attachment> attachments;
  final bool completed;
  final DateTime updatedAt;
  final SyncPendingOps pendingOp;
  final bool isDeleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    this.dueDate,
    required this.priority,
    this.attachments = const [],
    this.completed = false,
    required this.pendingOp,
    required this.updatedAt,
    this.isDeleted = false,
  });
}
