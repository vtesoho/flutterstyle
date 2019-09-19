import 'dart:convert';

import 'package:flutter/material.dart';

class BytesToString extends StatefulWidget {
  BytesToString({Key key}) : super(key: key);

  _BytesToStringState createState() => _BytesToStringState();
}

class _BytesToStringState extends State<BytesToString> {

  testBTS(){
    var list = [123, 34, 110, 97, 109, 101, 34, 58, 34, 73, 110, 116, 101, 114, 110, 97, 108, 32, 83, 101, 114, 118, 101, 114, 32, 69, 114, 114, 111, 114, 34, 44, 34, 109, 101, 115, 115, 97, 103, 101, 34, 58, 34, 65, 110, 32, 105, 110, 116, 101, 114, 110, 97, 108, 32, 115, 101, 114, 118, 101, 114, 32, 101, 114, 114, 111, 114, 32, 111, 99, 99, 117, 114, 114, 101, 100, 46, 34, 44, 34, 99, 111, 100, 101, 34, 58, 48, 44, 34, 115, 116, 97, 116, 117, 115, 34, 58, 53, 48, 48, 125];
    // print(base64Decode(list));
    // String ss = '';
    // for (var i = 0; i < list.length; i++) {
    //   ss += String.fromCharCode(list[i]);
    // }
    print(String.fromCharCodes(list));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bytesToString'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                testBTS();
              },
              child: Text('data'),
            )
          ],
        ),
      ),
    );
  }
}