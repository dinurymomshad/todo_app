class Todo {
  final String title;
  final bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });
}

List<Todo> taskList = [
  Todo(title: 'You can add todo by pressing the add button'),
  Todo(title: 'You can compelete task by pressing the checkbox'),
  Todo(title: 'Add a task'),
];
