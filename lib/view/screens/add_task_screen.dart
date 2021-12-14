import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/view_model/task_view_model.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  /// find the controller
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TaskViewModel taskController = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Task")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Type something",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  taskController.createTask(titleController.text);
                  Get.back();
                },
                child: const Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
