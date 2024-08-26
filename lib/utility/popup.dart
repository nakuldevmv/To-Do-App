import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/Home_page.dart';

class FirstTimePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Welcome to ToDo App!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tap + To Add New Task'),
          Text('Tap The CheckBox Once The Task Is Completed'),
          Text('Slide Right to Left To Delete A Task'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isFirstTime', false);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('Got It!'),
        ),
      ],
    );
  }
}
