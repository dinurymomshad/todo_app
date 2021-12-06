import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';

class TaskCard extends StatefulWidget {
  final int index;
  final String title;
  final bool isCompleted;
  const TaskCard({Key? key, required this.index, required this.title, this.isCompleted = false}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    /// find the controller
    final TaskController taskController = Get.find();

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async => taskController.deleteTask(widget.index),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(widget.title),
          trailing: Icon(
            widget.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () {
            taskController.updateTask(
              widget.index,
              !taskController.getTasks[widget.index].isCompleted,
            );
          }),
    );
  }
}
