import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/view/global_widgets/task_card.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// Instantiate controller
    final taskController = Get.put(TaskController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Get.to(() => const AddTaskScreen());
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Pending Tasks",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),

                /// TODO: Shrink wrap performance related issue
                Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: taskController.getTasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          index: index,
                          title: taskController.getTasks[index].title,
                          isCompleted: taskController.getTasks[index].isCompleted,
                        );
                      });
                })
              ],
            ),
          ),
        ));
  }
}
