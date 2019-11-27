import 'package:flutter/material.dart';

class TestTextAlign extends StatefulWidget {
  TestTextAlign({Key key}) : super(key: key);

  @override
  _TestTextAlignState createState() => _TestTextAlignState();
}

class _TestTextAlignState extends State<TestTextAlign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('QR Code'),
      ),
      body: Container(
        child: Text(
          '测试换行居中 \n 测试换行居中测试换行居中测试换行居中测试换行居中 \n 测试换行居中测试换行居中',
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}