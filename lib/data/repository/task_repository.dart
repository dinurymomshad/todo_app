import 'package:get/get.dart';
import 'package:todo_app/data/model/task_model.dart';

class TaskRepository {
  /// Task List
  final List<Todo> _taskList = [
    Todo(title: 'You can add todo by pressing the add button'),
    Todo(title: 'You can complete task by pressing the checkbox'),
    Todo(title: 'Add a task'),
  ];

  /// Get Tasks
  List<Todo> get getTasks => _taskList;

  /// Create Task
  Todo createTask(String title) {
    return Todo(title: title);
  }

  /// Update Task
  Todo updateTask(int index, bool isCompleted) {
    return Todo(title: _taskList[index].title, isCompleted: isCompleted);
  }

  /// Delete Task
  RxList<Todo> deleteTask(int index, RxList<Todo> taskList) {
    taskList.removeAt(index);
    return taskList;
  }
}
