import '../models/task.dart';
import '../services/task_service.dart';

class TaskRepository {
  final TaskService service;

  TaskRepository(this.service);

  Future<List<Task>> getTasks() async {
    return await service.fetchTasks();
  }
}
