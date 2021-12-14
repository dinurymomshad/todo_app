import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/view_model/task_view_model.dart';

class TaskCard extends StatelessWidget {
  final int index;
  final String title;
  final bool isCompleted;

  const TaskCard({Key? key, required this.index, required this.title, this.isCompleted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// find the controller
    final TaskViewModel taskController = Get.find();

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async => taskController.deleteTask(index),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          trailing: Icon(
            isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () {
            taskController.updateTask(
              index,
              !taskController.getTasks[index].isCompleted,
            );
          }),
    );
  }
}
