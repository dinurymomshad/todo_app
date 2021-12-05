import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  /// find the controller
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
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
