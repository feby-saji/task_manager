import 'package:task_manager/core/enums.dart';
import 'package:task_manager/domain/entities/attachments.dart';
import 'package:task_manager/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Task> createTask(Task task);
  Future<List<Task>> getAllTasks(String userId);
  Future<Task> updateTask(Task task);
  Future<void> markcompletedTask(String taskId);

  Future<void> softDelTaskLocal(String taskId);
  Future<void> hardDelTaskLocal(String taskId);

  Future<void> softDelTaskRemote(String taskId);
  Future<void> hardDelTaskRemote(String taskId);

  // sync
  Future<void> markDirtyTask(String taskId, SyncPendingOps pendingOp);
  Future<void> markTaskAsSynced(String taskId); // mark pendingOp as NONE

  Future<void> getDirtyTasks(); // filter pendingOp != none
  Future<void> pushDirtyTasks(); // push all local dirty tasks

  Future<void> pullRemoteTasks(); // pull tasks updated after lastSync

  // Attachments
  Future<Attachment> addAttachment(Attachment attachment);
  Future<Attachment> updateAttachment(Attachment attachment);
  Future<Attachment> getAttachmentOfTask(String taskId);

  Future<void> softDelAttachmentLocal(String attachmentId);
  Future<void> hardDelAttachmentLocal(String attachmentId);

  Future<void> softDelAttachmentRemote(String attachmentId);
  Future<void> hardDelAttachmentRemote(String attachmentId);

  // Attachments sync
  Future<void> markDirtyAttachment(String attachId, SyncPendingOps pendingOp);
  Future<void> markAttachmentAsSynced(Task task); // mark pendingOp as NONE
  Future<void> pushDirtyAttachments();
  Future<void> pullRemoteAttachments();
}
