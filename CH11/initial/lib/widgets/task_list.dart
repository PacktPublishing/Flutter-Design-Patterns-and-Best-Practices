import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onToggle;
  final Function(Task) onDelete;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => onToggle(task),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onDelete(task),
          ),
        );
      },
    );
  }
}
