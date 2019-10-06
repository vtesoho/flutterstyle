import 'package:flutter/material.dart';

class TestRouter extends StatefulWidget {
  TestRouter({Key key}) : super(key: key);

  _TestRouterState createState() => _TestRouterState();
}

class _TestRouterState extends State<TestRouter> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('testrouter'),
    );
  }
}