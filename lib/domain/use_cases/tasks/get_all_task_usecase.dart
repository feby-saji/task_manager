import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class GetAllTaskUsecase {
  final TaskRepository repo;

  GetAllTaskUsecase(this.repo);

  Future<List<Task>> execute(String userId) async {
    return await repo.getAllTasks(userId);
  }
}
