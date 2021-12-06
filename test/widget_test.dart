// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/view/global_widgets/task_card.dart';
import 'package:todo_app/view/screens/add_task_screen.dart';
import 'package:todo_app/view/screens/home_screen.dart';

void main() {
  group('Home Screen', () {
    TaskController taskController;

    setUpAll(() {
      /// Initialize controllers
      taskController = TaskController();
      Get.put(taskController);
    });

    testWidgets('When Home screen is initialized then find three tasks in-completed', (WidgetTester tester) async {
      /// Build and trigger a frame
      await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

      /// Initially find three Element [of type TaskCard] in the Listview.builder
      expect(find.byWidgetPredicate((widget) => widget is TaskCard && !widget.isCompleted), findsNWidgets(3));
    });

    testWidgets('When a task is tapped then find that task as completed', (WidgetTester tester) async {
      /// Build and trigger a frame
      await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

      /// Tap on a element from the List of Tasks
      await tester.tap(find.text('Add a task'));
      await tester.pump();

      /// Find one completed element of type TaskCard
      expect(find.byWidgetPredicate((widget) => widget is TaskCard && widget.isCompleted), findsOneWidget);
    });

    testWidgets('When Task is created then list will be updated with newly added task', (WidgetTester tester) async {
      /// Build and trigger a frame
      await tester.pumpWidget(const GetMaterialApp(home: AddTaskScreen()));

      /// Enter text into the TextField
      await tester.enterText(find.byType(TextField), 'New Task');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

      /// Ensure 4 elements in total after adding the new task
      expect(find.byType(TaskCard), findsNWidgets(4));

      /// Ensure Newly added task is present in the list
      expect(find.text('New Task'), findsOneWidget);
    });

    testWidgets('When swiped to dismiss then an element will be removed from the task list', (WidgetTester tester) async {
      /// Build and trigger a frame
      await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

      /// Swipe the item to dismiss it
      await tester.drag(find.text('Add a task'), const Offset(500, 0));

      /// Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();

      /// Ensure that item is no longer on the screen
      expect(find.text('Add a task'), findsNothing);

      /// Ensure only two item remains
      expect(find.byWidgetPredicate((widget) => widget is TaskCard && !widget.isCompleted), findsNWidgets(3),
          reason:
              'Since we added a new task total number of widget is 4 and removing one we should get 3 widgets');
    });
  });
}
