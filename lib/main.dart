import 'package:flutter/material.dart';
import 'package:flutter_ex1/page/Setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      home: SettingPage()
    );
    return materialApp;
  }
}
