// ============================================================================
//                                APP FAILURE MODEL
// ============================================================================
//
//  - All failures in the app extend the base `Failure` class.
//  - Each feature has its own failure hierarchy using `sealed` classes.
//  - Core failures apply across the entire application (shared layer).
//  - Feature failures provide more domain-specific meaning for UI and logic.
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

/// Represents local storage errors such as SQFlite, Hive, or SharedPreferences.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// ============================================================================
//                            AUTHENTICATION FAILURES
// ============================================================================
//
// `AuthFailure` acts as a parent type for all errors that occur
// during login, signup, token refresh, or account linking.
//
// ----------------------------------------------------------------------------

sealed class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Wrong email/password / credential mismatch
class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure([
    super.message = 'Invalid email or password. Please try again.',
  ]);
}

/// Email already used during signup
class EmailInUseFailure extends AuthFailure {
  const EmailInUseFailure([super.message = 'This email is already in use.']);
}

/// Occurs when linking anonymous or social accounts fails
class AccountLinkingFailure extends AuthFailure {
  const AccountLinkingFailure([super.message = 'Unable to link this account.']);
}

/// User canceled login (common with Google/Apple sign-in)
class AuthCancelledFailure extends AuthFailure {
  const AuthCancelledFailure([super.message = 'Login cancelled.']);
}

/// Unhandled server/unknown auth error
class AuthServerFailure extends AuthFailure {
  const AuthServerFailure([
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

sealed class TaskFailure extends Failure {
  const TaskFailure(super.message);
}

/// Task not found locally or remotely
class TaskNotFoundFailure extends TaskFailure {
  const TaskNotFoundFailure([super.message = 'Task not found.']);
}

/// Error pushing/pulling tasks from remote database
class TaskSyncFailure extends TaskFailure {
  const TaskSyncFailure([
    super.message = 'Failed to sync tasks with the server.',
  ]);
}

/// Error applying a task update
class TaskUpdateFailure extends TaskFailure {
  const TaskUpdateFailure([super.message = 'Failed to update task.']);
}

/// Error creating a new task
class TaskCreationFailure extends TaskFailure {
  const TaskCreationFailure([super.message = 'Failed to create task.']);
}

// ============================================================================
//                            ATTACHMENT FAILURES
// ============================================================================
//
// For file operations: upload, delete, remote sync, and storage issues.
//
// ----------------------------------------------------------------------------

sealed class AttachmentFailure extends Failure {
  const AttachmentFailure(super.message);
}

/// Failed to upload file to remote storage
class AttachmentUploadFailure extends AttachmentFailure {
  const AttachmentUploadFailure([super.message = 'Attachment upload failed.']);
}

/// Failed to delete file from remote storage
class AttachmentDeleteFailure extends AttachmentFailure {
  const AttachmentDeleteFailure([
    super.message = 'Failed to delete attachment.',
  ]);
}

/// Failed syncing attachment metadata or state with backend
class AttachmentSyncFailure extends AttachmentFailure {
  const AttachmentSyncFailure([
    super.message = 'Failed to sync attachment state.',
  ]);
}
