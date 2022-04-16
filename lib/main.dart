import 'dart:developer';

import 'package:assignment3/pages/todo_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoHomePage(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  changesIsChecked() {
    isChecked = !isChecked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log('my build function has been reexcuted');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const FlutterLogo(
            size: 200,
          ),
          const Text(
            'User name',
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            'password',
            style: TextStyle(fontSize: 20),
          ),
          CustomCheckBox(isChecked, changesIsChecked),
          ElevatedButton(
              onPressed: () {}, child: const Text("print checkbox state"))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  bool x;
  Function fun;
  CustomCheckBox(this.x, this.fun, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CustomCheckBoxState();
  }
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.x,
      onChanged: (v) {
        widget.fun();
        setState(() {});
      },
      title: const Text('Light Mode'),
    );
  }
}
