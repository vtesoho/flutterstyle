// 因为listview 没用好所引发的崩溃

import 'dart:async';

import 'package:flutter/material.dart';

class ListviewCrasheDemo extends StatefulWidget {
  ListviewCrasheDemo({Key key}) : super(key: key);

  @override
  _ListviewCrasheDemoState createState() => _ListviewCrasheDemoState();
}

class _ListviewCrasheDemoState extends State<ListviewCrasheDemo> {
  ScrollController _controller = ScrollController();
  
  List longArr = [
    'http://iph.href.lu/200x200?bg=ff0000',
    'http://iph.href.lu/200x200?bg=00ff00',
    'http://iph.href.lu/200x200?bg=0000ff',
    'http://iph.href.lu/201x201?bg=ff0000',
    'http://iph.href.lu/201x201?bg=00ff00',
    'http://iph.href.lu/201x201?bg=0000ff',
    'http://iph.href.lu/202x202?bg=ff0000',
    'http://iph.href.lu/202x202?bg=00ff00',
    'http://iph.href.lu/202x202?bg=0000ff',
    'http://iph.href.lu/203x203?bg=ff0000',
    'http://iph.href.lu/203x203?bg=00ff00',
    'http://iph.href.lu/203x203?bg=0000ff',
    'http://iph.href.lu/204x204?bg=ff0000',
    'http://iph.href.lu/204x204?bg=00ff00',
    'http://iph.href.lu/204x204?bg=0000ff',
    'http://iph.href.lu/205x205?bg=ff0000',
    'http://iph.href.lu/205x205?bg=00ff00',
    'http://iph.href.lu/205x205?bg=0000ff',
    'http://iph.href.lu/206x206?bg=ff0000',
    'http://iph.href.lu/206x206?bg=00ff00',
    'http://iph.href.lu/206x206?bg=0000ff',
  ];
  bool one = true;
  int index = 207;

  @override
  void initState() {
    _controller.addListener((){
      if(_controller.position.pixels > _controller.position.maxScrollExtent) {
        if(one){
          print('模拟上拉加载更多');
          one = false;
          longArr.add('http://iph.href.lu/${index}x$index?bg=ff0000');
          longArr.add('http://iph.href.lu/${index}x$index?bg=00ff00');
          longArr.add('http://iph.href.lu/${index}x$index?bg=0000ff');
          longArr.add('http://iph.href.lu/${index}x$index?bg=000ff0');
          longArr.add('http://iph.href.lu/${index}x$index?bg=0ffff0');
          index++;
          setState(() {});
          Timer(Duration(seconds: 1),(){
            one = true;
          });
        }
      } 
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListviewCrasheDemo'),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index){
              return handelItem(context,index);
            },
              childCount: 10,
            ),
            
          )
        ],
      ),
    );
  }

  Widget handelItem(context,index){
    if(index == 0){
      return longWidget();
    }
    return Text('$index');
  }



  Widget longWidget(){
    List<Widget> children = [];
    
    longArr.forEach((f){
      children.add(
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          alignment: Alignment.center,
          child: Image.network(
            '$f',
          ),
        )
      );
    });
    return Column(
      children: children,
    );
  }
}