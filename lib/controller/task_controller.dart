import 'package:get/get.dart';
import 'package:todo_app/model/task_model.dart';

class TaskController extends GetxController {
  /// Task List
  final List<Todo> _taskList = [
    Todo(title: 'You can add todo by pressing the add button'),
    Todo(title: 'You can complete task by pressing the checkbox'),
    Todo(title: 'Add a task'),
  ].obs;

  /// Get Tasks
  List<Todo> get  getTasks => _taskList;

  /// Create Task
  createTask(String title) {
    _taskList.add(Todo(title: title));
  }

  /// Update Task
  updateTask(int index, bool isCompleted) {
    _taskList[index] = Todo(title: _taskList[index].title, isCompleted: isCompleted);
  }

  /// Delete Task
  deleteTask(int index) {
    _taskList.removeAt(index);
  }
}
