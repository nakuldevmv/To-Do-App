//paste in utility folder

import 'package:flutter/material.dart';

import 'mybutton.dart';

class DialogeBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCanceled;
  DialogeBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCanceled});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color(0xFF303030),
      content: Container(
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a New Task',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                border: OutlineInputBorder(), // Default border
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00C9C8), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Change this to your desired color
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: "save", onPressed: onSaved),
                MyButton(text: "cancel", onPressed: onCanceled)

                //save button
              ],
            )
          ],
        ),
      ),
    );
  }
}
