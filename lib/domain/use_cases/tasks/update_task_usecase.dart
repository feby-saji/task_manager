import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class UpdateTaskUsecase {
  final TaskRepository repo;

  UpdateTaskUsecase(this.repo);

  Future<void> execute(Task task) async {
    await repo.updateTask(task);
  }
}
