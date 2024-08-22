import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoTileItem = [];
  final _myBox = Hive.box('mybox');
  void createInitData() {
    toDoTileItem = [
      ["Tap + To Add New Task", false],
      ["Tap The CheckBox Once The Task Is Completed", false],
      ["Slide Right to Left To Delete A Task", false]
    ];
  }

  void loadData() {
    final data = _myBox.get("TODOLIST");
    if (data != null) {
      toDoTileItem = data;
    } else {
      createInitData();
    }
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoTileItem);
  }
}
