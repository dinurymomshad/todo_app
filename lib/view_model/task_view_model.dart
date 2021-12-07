import 'package:get/get.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/repository/task_repository.dart';

class TaskViewModel extends GetxController {
  final TaskRepository repository;

  TaskViewModel({required this.repository});

  /// Task List
  RxList<Todo> _taskList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _taskList.value = repository.getTasks;
  }

  /// Get Tasks
  RxList<Todo> get getTasks => _taskList;

  /// Create Task
  createTask(String title) => _taskList.add(repository.createTask(title));

  /// Update Task
  updateTask(int index, bool isCompleted) => _taskList[index] = repository.updateTask(index, isCompleted);

  /// Delete Task
  deleteTask(int index) {
    _taskList = repository.deleteTask(index, _taskList);
  }
}
