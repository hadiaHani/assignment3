// ignore_for_file: must_be_immutable

import 'package:assignment3/data/tasks_data.dart';
import 'package:assignment3/widgets/task_widget.dart';
import 'package:flutter/material.dart';

class AllTasksScreen extends StatefulWidget {
  Function fun;
  Function fun2;

  AllTasksScreen(this.fun, this.fun2, {Key? key}) : super(key: key);

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return TaskWidget(tasksList[index], widget.fun, () {
            setState(() {
              widget.fun2;
            });
          });
        });
  }
}
