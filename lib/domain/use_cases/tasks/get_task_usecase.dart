import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class GetTaskUsecase {
  final TaskRepository repo;

  GetTaskUsecase(this.repo);

  Future<Task> execute(String taskId) async {
    return await repo.getTask(taskId);
  }
}
