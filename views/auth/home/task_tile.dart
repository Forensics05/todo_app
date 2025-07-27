import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../controllers/task_controller.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskCtrl = Provider.of<TaskController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Slidable(
        key: ValueKey(task.id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (_) => taskCtrl.deleteTask(task.id),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => taskCtrl.toggleTask(task.id),
          child: Container(
            decoration: BoxDecoration(
              color: task.isComplete ? Colors.green[100] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                )
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: task.isComplete ? TextDecoration.lineThrough : null,
                    color: task.isComplete ? Colors.grey : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    decoration: task.isComplete ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Due: ${task.dueDate.toLocal().toString().split(' ')[0]}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Icon(
                      task.isComplete ? Icons.check_circle : Icons.circle_outlined,
                      color: task.isComplete ? Colors.green : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}