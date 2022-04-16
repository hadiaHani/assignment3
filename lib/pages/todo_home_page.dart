import 'package:assignment3/data/tasks_data.dart';
import 'package:assignment3/models/tasks_model.dart';
import 'package:assignment3/pages/all_tasks.dart';
import 'package:assignment3/pages/complete_tasks.dart';
import 'package:assignment3/pages/incomplete_tasks.dart';
import 'package:flutter/material.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  changeTaskCompleteness(Task task) {
    int index = tasksList.indexOf(task);
    tasksList[index].isCompleted = !tasksList[index].isCompleted;
    setState(() {});
  }

  // deleteTask(Task task) {
  //   setState(() {
  //     for (int i = 0; i <= tasksList.length - 1; i++) {
  //       if (task.id == tasksList.elementAt(i).id) {
  //         log(task.id.toString());
  //         tasksList.removeAt(i);
  //       }
  //     }
  //     tasksList;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TODO APP'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'All Tasks',
              ),
              Tab(
                icon: Icon(Icons.done),
                text: 'Complete Tasks',
              ),
              Tab(
                icon: Icon(Icons.cancel),
                text: 'InComplete Tasks',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(changeTaskCompleteness, () {
                setState(() {
                  tasksList;
                });
              }),
              CompleteTasksScreen(changeTaskCompleteness, () => tasksList),
              InCompleteTasksScreen(changeTaskCompleteness, () => tasksList)
            ],
          ),
        ));
  }
}
