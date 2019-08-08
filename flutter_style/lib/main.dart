import 'package:flutter/material.dart';
import 'package:flutter_style/page/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}