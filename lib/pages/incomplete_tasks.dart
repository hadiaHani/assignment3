import 'package:assignment3/data/tasks_data.dart';
import 'package:assignment3/widgets/task_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InCompleteTasksScreen extends StatefulWidget {
  Function fun;
  Function fun2;

  InCompleteTasksScreen(this.fun, this.fun2, {Key? key}) : super(key: key);

  @override
  State<InCompleteTasksScreen> createState() => _InCompleteTasksScreenState();
}

class _InCompleteTasksScreenState extends State<InCompleteTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasksList.where((element) => !element.isCompleted).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasksList
                  .where((element) => !element.isCompleted)
                  .toList()[index],
              widget.fun,
              widget.fun2);
        });
  }
}
