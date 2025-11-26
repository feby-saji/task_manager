import 'package:task_manager/features/tasks/domain/entities/task.dart';
import 'package:task_manager/features/tasks/domain/repositories/task_repository.dart';

class GetAllTaskUsecase {
  final TaskRepository repo;

  GetAllTaskUsecase(this.repo);

  Future<List<Task>> execute(String userId) async {
    return await repo.getAllTasks(userId);
  }
}
