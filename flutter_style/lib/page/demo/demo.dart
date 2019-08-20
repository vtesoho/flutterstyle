import 'package:flutter/material.dart';
import 'package:flutter_style/page/demo/async_demo.dart';
import 'package:flutter_style/page/demo/sqlift/sqlift_demo.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Wrap(
        children: <Widget>[
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AsyncDemo(),
            ));},
            'async',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SqliftDemo(),
            ));},
            'sqlift',
          ),
        ],
      ),
    );
  }



  Widget styleItem(jumpClass,title){
    return GestureDetector(
      onTap: () {
        jumpClass();
      },
      child: Container(
        color: Colors.red,
        child: Text('${title}'),
        width: 50,
        height: 50,
      ),
    );
  }

}