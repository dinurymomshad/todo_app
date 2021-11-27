import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  final VoidCallback reload;
  const AddTaskScreen({Key? key, required this.reload}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Task")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  hintText: "Type something",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  taskList.add(Todo(title: taskController.text));
                  widget.reload();
                  Navigator.pop(context);
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
