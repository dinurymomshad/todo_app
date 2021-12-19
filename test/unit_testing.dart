import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/data/model/task_model.dart';

void main() {
  late TaskController taskController;

  setUpAll(() {
    taskController = Get.put(TaskController());
  });

  test('Fetch Todo', () {
    expect(taskController.getTasks.length, 3);
  });

  test('Add a new task', () {
    taskController.createTask('New Task');
    expect(taskController.getTasks.length, 4);
  });

  test('Remove task', () {
    taskController.deleteTask(taskController.getTasks.indexWhere((element) => element.title == 'New Task'));
    expect(taskController.getTasks.contains(Todo(title: 'New Task')), false);
    expect(taskController.getTasks.length, 3);
  });
}
