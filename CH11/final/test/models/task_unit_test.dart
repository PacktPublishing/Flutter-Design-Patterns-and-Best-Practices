import 'package:ch11_testing/models/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task', () {
    test('should toggle completion status', () {
      final task = Task('Test Task');
      expect(task.isCompleted, false);
      task.toggleCompleted();
      expect(task.isCompleted, true);
    });
  });
}
