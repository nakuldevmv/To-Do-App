//paste in utility folder

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? onTap;

  toDoTile(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: (Icons.delete),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 13.1,
                    fontWeight: FontWeight.bold,
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF00C9C8),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
