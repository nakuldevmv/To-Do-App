import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/Home_page.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
