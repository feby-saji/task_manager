import 'package:task_manager/features/tasks/domain/entities/task.dart';
import 'package:task_manager/features/tasks/domain/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository repo;

  CreateTaskUsecase(this.repo);

  Future<void> execute(Task task) async {
    await repo.createTask(task);
  }
}
