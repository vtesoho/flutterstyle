import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('demo'),
    );
  }
}