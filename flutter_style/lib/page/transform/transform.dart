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
            SizedBox(height: 50,),
            alignmentAction(),
          ],
        ),
      ),
      body: Container(
        child: Transform(
          alignment: alignment,
          transform: transformWidget(),
          origin: originWidget(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,
            child: const Text('Apartment for rent!'),
          ),
        ),
      ),
    );
  }

  
  double originA = 0.0;
  double originB = 0.0;
  
  Offset originWidget(){
    return Offset(originA,originB);
  }
  originAction(){
    
  }

  Matrix4 transform = Matrix4.skewX(0.3);
  int transformType = 0;
  Matrix4 transformWidget(){
    switch (transformType) {
      case 0:
        return Matrix4.skewY(0.3);
        break;
      case 1:
        return Matrix4.skewY(0.3);
        break;
      default:
        return Matrix4.skewX(0.3);
    }
    // return Matrix4.skewX(0.3);
  }
  transformAction(){

  }

  Alignment alignment = Alignment.center;
  GlobalKey _alignmentKey = new GlobalKey();
  alignmentAction(){
    return GestureDetector(
      onTap: (){
        RenderBox renderBoxRed = _alignmentKey.currentContext.findRenderObject();
        print(renderBoxRed.size);
        print(renderBoxRed.localToGlobal(Offset.zero));
      },
      child: Container(
        key: _alignmentKey,
        color: Colors.red,
        width: 200,
        height: 200,
        child: Text('data'),
      ),
    );
  }


}