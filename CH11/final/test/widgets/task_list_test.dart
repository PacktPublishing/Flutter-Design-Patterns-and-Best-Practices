// test/widgets/task_list_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ch11_testing/models/task.dart';
import 'package:ch11_testing/widgets/task_list.dart';

void main() {
  testWidgets('should display a list of tasks', (WidgetTester tester) async {
    final tasks = [
      Task('Task 1'),
      Task('Task 2', isCompleted: true),
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskList(
          tasks: tasks,
          onToggle: (task) {},
          onDelete: (task) {},
        ),
      ),
    ));

    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);
    expect(find.byType(Checkbox), findsNWidgets(2));
  });

  testWidgets('should call onToggle when checkbox is tapped', (WidgetTester tester) async {
    final tasks = [Task('Task 1')];
    Task? toggledTask;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskList(
          tasks: tasks,
          onToggle: (task) => toggledTask = task,
          onDelete: (task) {},
        ),
      ),
    ));

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(toggledTask, equals(tasks[0]));
  });

  testWidgets('should call onDelete when delete button is tapped', (WidgetTester tester) async {
    final tasks = [Task('Task 1')];
    Task? deletedTask;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskList(
          tasks: tasks,
          onToggle: (task) {},
          onDelete: (task) => deletedTask = task,
        ),
      ),
    ));

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(deletedTask, equals(tasks[0]));
  });
}
