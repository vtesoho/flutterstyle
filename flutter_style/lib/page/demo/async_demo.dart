import 'dart:async';
import 'package:flutter/material.dart';

class AsyncDemo extends StatefulWidget {
  AsyncDemo({Key key}) : super(key: key);

  _AsyncDemoState createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('async'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print(asyncTestOne());
            },
            child: Container(
              child: Text('try有return，并抛出错误，catch没有return '),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestTwo());
            },
            child: Container(
              child: Text('try有return，并抛出错误，catch有return'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestThree());
            },
            child: Container(
              child: Text('try有return，并抛出错误，catch有return，有finally'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestThree());
            },
            child: Container(
              child: Text('try有return，并抛出错误，catch有return，有finally'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestFour());
            },
            child: Container(
              child: Text('try有return，并抛出错误，catch有return，抛出错误，有finally'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestFive());
            },
            child: Container(
              child: Text('try有return，有finally,finally里有return'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestSix());
            },
            child: Container(
              child: Text('try有return并抛出错误，catch有return，有finally,finally里有return'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestSeven());
            },
            child: Container(
              child: Text('try有return，有finally'),
            ),
          ),
          GestureDetector(
            onTap: (){
              print(asyncTestEight());
            },
            child: Container(
              child: Text('try有return并抛出错误，catch有return，finally有return'),
            ),
          ),

          
  
  
  
          
        ],
      ),
    );
  }
  Map testData = {
    "a":1
  };
  //try有return，并抛出错误，catch没有return
  asyncTestOne(){
    int start = 0;
    try {
      print('try start ${start++}');
      if(testData['bb']){
        print('try start ${start++}');
        print('抛出异常');
      }
      print('try start ${start++}');
      return 'try正常返回';
      
    } catch (e) {
      print('catch start = ${start++}');
      print('catch ----- $e');
    }
  }

  //try有return，并抛出错误，catch有return
  asyncTestTwo(){
    int start = 0;
    try {
      print('try start ${start++}');
      if(testData['bb']){
        print('try start ${start++}');
        print('抛出异常');
      }
      print('try start ${start++}');
      return 'try正常返回';
      
    } catch (e) {
      print('catch start = ${start++}');
      print('catch ----- $e');
      return 'catch return';
    }
  }

  //try有return，并抛出错误，catch有return，有finally
  asyncTestThree(){
    int start = 0;
    try {
      print('try start ${start++}');
      if(testData['bb']){
        print('try start ${start++}');
        print('抛出异常');
      }
      print('try start ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      print('catch ----- $e');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
    }
  }

  //try有return，并抛出错误，catch有return，抛出错误，有finally,finally里有return
  asyncTestFour(){
    int start = 0;
    try {
      print('try start ${start++}');
      if(testData['bb']){
        print('try ing ${start++}');
        print('抛出异常');
      }
      print('try end ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      if(testData['bb']){
        print('catch ing ${start++}');
        print('抛出异常');
      }
      print('catch error ----- $e');
      print('catch end ${start++}');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
      return 'finally return';
    }
  }

  //try有return，有finally,finally里有return
  asyncTestFive(){
    int start = 0;
    try {
      print('try start ${start++}');
      print('try end ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      if(testData['bb']){
        print('catch ing ${start++}');
        print('抛出异常');
      }
      print('catch error ----- $e');
      print('catch end ${start++}');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
      print('finally end = ${start++}');
      return 'finally return';
    }
  }

  //try有return并抛出错误，catch有return，有finally,finally里有return
  asyncTestSix(){
    int start = 0;
    try {
      print('try start ${start++}');
      if(testData['bb']){
        print('catch ing ${start++}');
        print('抛出异常');
      }
      print('try end ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      print('catch error ----- $e');
      print('catch end ${start++}');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
      print('finally end = ${start++}');
      return 'finally return';
    }
  }

  //try有return，有finally
  asyncTestSeven(){
    int start = 0;
    try {
      print('try start ${start++}');
      print('try end ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      if(testData['bb']){
        print('catch ing ${start++}');
        print('抛出异常');
      }
      print('catch error ----- $e');
      print('catch end ${start++}');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
      print('finally end = ${start++}');
    }
  }

  //try有return并抛出错误，catch有return，finally有return
  asyncTestEight(){
    int start = 0;
    try {
      print('try start ${start++}');
      print('try end ${start++}');
      return 'try return';
    } catch (e) {
      print('catch start = ${start++}');
      if(testData['bb']){
        print('catch ing ${start++}');
        print('抛出异常');
      }
      print('catch error ----- $e');
      print('catch end ${start++}');
      return 'catch return';
    } finally {
      print('finally start = ${start++}');
      print('finally end = ${start++}');
      return 'finally return';
    }
  }

  

}