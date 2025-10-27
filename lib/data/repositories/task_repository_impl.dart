import 'package:task_manager/core/enums.dart';
import 'package:task_manager/domain/entities/attachments.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<Attachment> addAttachment(Attachment attachment) {
    // TODO: implement addAttachment
    throw UnimplementedError();
  }

  @override
  Future<Task> createTask(Task task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks(String userId) {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Attachment> getAttachmentOfTask(String taskId) {
    // TODO: implement getAttachmentOfTask
    throw UnimplementedError();
  }

  @override
  Future<void> getDirtyTasks() {
    // TODO: implement getDirtyTasks
    throw UnimplementedError();
  }

  @override
  Future<void> hardDelAttachmentLocal(String attachmentId) {
    // TODO: implement hardDelAttachmentLocal
    throw UnimplementedError();
  }

  @override
  Future<void> hardDelAttachmentRemote(String attachmentId) {
    // TODO: implement hardDelAttachmentRemote
    throw UnimplementedError();
  }

  @override
  Future<void> hardDelTaskLocal(String taskId) {
    // TODO: implement hardDelTaskLocal
    throw UnimplementedError();
  }

  @override
  Future<void> hardDelTaskRemote(String taskId) {
    // TODO: implement hardDelTaskRemote
    throw UnimplementedError();
  }

  @override
  Future<void> markAttachmentAsSynced(Task task) {
    // TODO: implement markAttachmentAsSynced
    throw UnimplementedError();
  }

  @override
  Future<void> markDirtyAttachment(String attachId, SyncPendingOps pendingOp) {
    // TODO: implement markDirtyAttachment
    throw UnimplementedError();
  }

  @override
  Future<void> markDirtyTask(String taskId, SyncPendingOps pendingOp) {
    // TODO: implement markDirtyTask
    throw UnimplementedError();
  }

  @override
  Future<void> markTaskAsSynced(String taskId) {
    // TODO: implement markTaskAsSynced
    throw UnimplementedError();
  }

  @override
  Future<void> markcompletedTask(String taskId) {
    // TODO: implement markcompletedTask
    throw UnimplementedError();
  }

  @override
  Future<void> pullRemoteAttachments() {
    // TODO: implement pullRemoteAttachments
    throw UnimplementedError();
  }

  @override
  Future<void> pullRemoteTasks() {
    // TODO: implement pullRemoteTasks
    throw UnimplementedError();
  }

  @override
  Future<void> pushDirtyAttachments() {
    // TODO: implement pushDirtyAttachments
    throw UnimplementedError();
  }

  @override
  Future<void> pushDirtyTasks() {
    // TODO: implement pushDirtyTasks
    throw UnimplementedError();
  }

  @override
  Future<void> softDelAttachmentLocal(String attachmentId) {
    // TODO: implement softDelAttachmentLocal
    throw UnimplementedError();
  }

  @override
  Future<void> softDelAttachmentRemote(String attachmentId) {
    // TODO: implement softDelAttachmentRemote
    throw UnimplementedError();
  }

  @override
  Future<void> softDelTaskLocal(String taskId) {
    // TODO: implement softDelTaskLocal
    throw UnimplementedError();
  }

  @override
  Future<void> softDelTaskRemote(String taskId) {
    // TODO: implement softDelTaskRemote
    throw UnimplementedError();
  }

  @override
  Future<Attachment> updateAttachment(Attachment attachment) {
    // TODO: implement updateAttachment
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<Task> getTask(String taskId) {
    // TODO: implement getTask
    throw UnimplementedError();
  }
}