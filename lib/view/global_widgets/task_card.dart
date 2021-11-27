import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final VoidCallback onDissmissed;

  const TaskCard({
    Key? key,
    required this.title,
    required this.onDissmissed,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        /// TODO: remove item using index
        taskList.removeWhere((element) => element.title == widget.title);
        widget.onDissmissed();
      },
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(widget.title),
          trailing: Icon(
            isDone ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () {
            /// TODO: update state in the list
            setState(() {
              isDone = !isDone;
            });
          }),
    );
  }
}
