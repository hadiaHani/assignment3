import 'package:assignment3/data/tasks_data.dart';
import 'package:assignment3/widgets/task_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompleteTasksScreen extends StatelessWidget {
  Function fun;
  Function fun2;

  CompleteTasksScreen(this.fun, this.fun2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasksList.where((element) => element.isCompleted).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasksList.where((element) => element.isCompleted).toList()[index],
              fun,
              fun2);
        });
  }
}
