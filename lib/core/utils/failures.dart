// ============================================================================
//                                APP FAILURE MODEL
// ============================================================================
//
//  - All failures in the app extend the base `Failure` class.
//
// ============================================================================

/// Base failure class that all other failures inherit from.
/// Holds a human-readable message intended for UI display.
abstract class Failure {
  final String message;

  const Failure(this.message);
}

// ============================================================================
//                                CORE FAILURES
// ============================================================================
//
// These represent failures that apply across the entire app.
//
// ----------------------------------------------------------------------------

/// Represents a backend error where the device was ONLINE,
/// but the server returned an error response.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents failure due to lack of connectivity.
/// Useful when a request couldn't even reach the server.
class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('No internet connection. Please check your network.');
}

class SupabasePermissionFailure extends Failure {
  const SupabasePermissionFailure([
    super.message = 'supabase Permission denied.',
  ]);
}

/// Represents local storage errors such as SQFlite, Hive, or SharedPreferences.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

// ============================================================================
//                            AUTHENTICATION FAILURES
// ============================================================================
//
// ----------------------------------------------------------------------------

class InvalidSessionFailure extends Failure {
  const InvalidSessionFailure([super.message = 'signIn failed']);
}

/// Occurs when linking anonymous or social accounts fails
class AccountLinkingFailure extends Failure {
  const AccountLinkingFailure([super.message = 'Unable to link this account.']);
}

/// User canceled login (common with Google/Apple sign-in)
class AuthCancelledFailure extends Failure {
  const AuthCancelledFailure([super.message = 'Login cancelled.']);
}

/// Unhandled server/unknown auth error
class AuthServerFailure extends Failure {
  const AuthServerFailure([
    super.message = 'Authentication failed due to a server error.',
  ]);
}

class SignOutFailure extends Failure {
  const SignOutFailure([
    super.message = 'Authentication failed due to a server error.',
  ]);
}

// ============================================================================
//                                 TASK FAILURES
// ============================================================================
//
// Failures related to task creation, update, deletion, and syncing.
//
// ----------------------------------------------------------------------------

/// Task not found locally or remotely
class TaskNotFoundFailure extends Failure {
  const TaskNotFoundFailure([super.message = 'Task not found.']);
}

/// Error pushing/pulling tasks from remote database
class TaskSyncFailure extends Failure {
  const TaskSyncFailure([
    super.message = 'Failed to sync tasks with the server.',
  ]);
}

/// Error applying a task update
class TaskUpdateFailure extends Failure {
  const TaskUpdateFailure([super.message = 'Failed to update task.']);
}

/// Error creating a new task
class TaskCreationFailure extends Failure {
  const TaskCreationFailure([super.message = 'Failed to create task.']);
}

// ============================================================================
//                            ATTACHMENT FAILURES
// ============================================================================
//
// For file operations: upload, delete, remote sync, and storage issues.
//
// ----------------------------------------------------------------------------

/// Failed to upload file to remote storage
class AttachmentUploadFailure extends Failure {
  const AttachmentUploadFailure([super.message = 'Attachment upload failed.']);
}

/// Failed to delete file from remote storage
class AttachmentDeleteFailure extends Failure {
  const AttachmentDeleteFailure([
    super.message = 'Failed to delete attachment.',
  ]);
}

/// Failed syncing attachment metadata or state with backend
class AttachmentSyncFailure extends Failure {
  const AttachmentSyncFailure([
    super.message = 'Failed to sync attachment state.',
  ]);
}
