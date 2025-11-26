import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/core/enums.dart';

part 'attachments.freezed.dart';

@freezed
abstract class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String taskId,
    String? localPath, // null if only downloaded from remote
    String? url, // null if not in supabse yet
    @Default(false) bool isDeleted,
    required AttachmentType type,
    required SyncPendingOps pendingOp,
  }) = _Attachment;
}
