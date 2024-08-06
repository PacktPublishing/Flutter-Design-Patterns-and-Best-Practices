// test/repositories/task_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ch11_testing/repositories/task_repository.dart';
import 'package:ch11_testing/services/task_service.dart';
import 'package:ch11_testing/models/task.dart';

// Generate a MockTaskService class
@GenerateMocks([TaskService])
import 'task_repository_test.mocks.dart';

void main() {
  group('TaskRepository', () {
    late TaskRepository repository;
    late MockTaskService mockService;

    setUp(() {
      mockService = MockTaskService();
      repository = TaskRepository(mockService);
    });

    test('should fetch tasks from the service', () async {
      when(mockService.fetchTasks()).thenAnswer((_) async => [Task('Mock Task 1'), Task('Mock Task 2')]);

      final tasks = await repository.getTasks();

      expect(tasks.length, 2);
      expect(tasks[0].title, 'Mock Task 1');
      expect(tasks[1].title, 'Mock Task 2');
      verify(mockService.fetchTasks()).called(1);
    });
  });
}
