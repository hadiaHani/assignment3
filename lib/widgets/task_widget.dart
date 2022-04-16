import 'dart:developer';

import 'package:assignment3/data/tasks_data.dart';
import 'package:assignment3/models/tasks_model.dart';
import 'package:assignment3/pages/todo_home_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  Function fun;
  Function fun2;
  Task task;
  TaskWidget(this.task, this.fun, this.fun2, {Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  deleteTask(Task task) {
    setState(() {
      for (int i = 0; i <= tasksList.length - 1; i++) {
        if (task == tasksList.elementAt(i)) {
          log(i.toString());
          tasksList.removeAt(i);
          tasksList;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: widget.task.isCompleted ? Colors.green : Colors.black45,
      child: Row(children: [
        IconButton(
            onPressed: () {
              setState(() {
                deleteTask(widget.task);
                widget.fun2;
              });
            },
            icon: const Icon(Icons.delete)),
        Text(widget.task.title),
        Checkbox(
          value: widget.task.isCompleted,
          onChanged: (v) {
            widget.fun(widget.task);
          },
        ),
      ]),
    );
  }
}
