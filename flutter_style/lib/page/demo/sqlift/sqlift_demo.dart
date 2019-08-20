import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_style/page/demo/sqlift/sqlift_class.dart';

class SqliftDemo extends StatefulWidget {
  SqliftDemo({Key key}) : super(key: key);

  _SqliftDemoState createState() => _SqliftDemoState();
}

class _SqliftDemoState extends State<SqliftDemo> {
  @override
  void initState() {
    super.initState();
  }

  openSqlite() async {
    await SqlManager.init();
    var a = await SqlManager.isTableExits('log');
    print(a);
    await SqlManager.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqlift Demo'),
      ),
      body: Container(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                StatisticData().init();
              },
              child: Text('初始化'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticData().insert('1', datas,'log');
              },
              child: Text('执行插入'),
            ),
            FlatButton(
              onPressed: (){
                StatisticData().select('log');
              },
              child: Text('展示'),
            ),
            FlatButton(
              onPressed: (){
                StatisticData().delete('log');
              },
              child: Text('删除'),
            ),

            FlatButton(
              onPressed: (){
                StatisticAction().init();
              },
              child: Text('启动统计'),
            ),
            FlatButton(
              onPressed: (){
                StatisticAction().close();
              },
              child: Text('关闭统计'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          openSqlite();
          print('执行创建');
        },
      ),
    );
  }
}
