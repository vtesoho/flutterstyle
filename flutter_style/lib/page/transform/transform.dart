import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  TransformDemo({Key key}) : super(key: key);

  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transform'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            alignmentAction(),
          ],
        ),
      ),
      body: Container(
        child: Transform(
          alignment: alignment,
          transform: transform,
          
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,
            child: const Text('Apartment for rent!'),
          ),
        ),
      ),
    );
  }

  Matrix4 transform = Matrix4.skewX(0.3);
  transformAction(){
    
  }

  Alignment alignment = Alignment.center;
  alignmentAction(){

  }


}