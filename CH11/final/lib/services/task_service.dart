import '../models/task.dart';

class TaskService {
  Future<List<Task>> fetchTasks() async {
    // We can have our network call here.
    return [Task('Fetched Task 1'), Task('Fetched Task 2')];
  }
}
