import 'package:task_manager/core/enums.dart';

class Attachment {
  final String id;
  final String taskId;
  final String? localPath; // null if only downloaded from remote
  final String? url; // null if not in supabse yet
  final bool isDeleted;
  final AttachmentType type;
  final SyncPendingOps pendingOp;

  Attachment({
    required this.id,
    required this.taskId,
    this.localPath,
    this.url,
    this.isDeleted = false,
    required this.type,
    required this.pendingOp,
  });
}
