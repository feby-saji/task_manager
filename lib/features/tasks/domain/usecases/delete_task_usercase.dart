import 'package:task_manager/features/tasks/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository repo;

  DeleteTaskUsecase(this.repo);

  Future<void> execute(String taskId) async {
    await repo.softDelTaskLocal(taskId);
  }
}
