//g
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app_v2/data/database.dart';

import '../utility/dialoge_box.dart';
import '../utility/to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refference box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == Null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  //list to do tasks

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoTileItem[index][1] = !db.toDoTileItem[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoTileItem.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogeBox(
          controller: _controller,
          onSaved: saveNewTask,
          onCanceled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoTileItem.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Center(
          // ignore: prefer_const_constructors
          child: Text(
            " To Do ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF303030),
        onPressed: addNewTask,
        child: Icon(
          Icons.add,
          size: 40,
          color: Color(0xFF00C9C8),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoTileItem.length,
        itemBuilder: (context, index) {
          return toDoTile(
            taskname: db.toDoTileItem[index][0],
            taskcompleted: db.toDoTileItem[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
    );
  }
}
