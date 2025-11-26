import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/core/enums.dart';
import 'package:task_manager/features/tasks/domain/entities/attachments.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String userId,
    required String title,
    String? description,
    DateTime? dueDate,
    required TaskPriority priority,
    @Default([]) List<Attachment> attachments,
    @Default(false) bool completed,
    required SyncPendingOps pendingOp,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _Task;
}
