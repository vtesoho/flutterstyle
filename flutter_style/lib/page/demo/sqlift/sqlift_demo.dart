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
                StatisticAction().init();
              },
              child: Text('初始化'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticData().insert('1', datas,'52','log');
              },
              child: Text('执行插入52'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticData().insert('1', datas,'53','log');
              },
              child: Text('执行插入53'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticData().insert('1', datas,'54','log');
              },
              child: Text('执行插入54'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticData().insert('1', datas,'55','log');
              },
              child: Text('执行插入55'),
            ),
            FlatButton(
              onPressed: (){
                var dataa = {'1':'1111111111'};
                var datas = json.encode(dataa);
                StatisticAction().add('1', datas);
              },
              child: Text('正常插入55'),
            ),
            FlatButton(
              onPressed: () async{
                var a = await StatisticData().select('log');
                print(a);
              },
              child: Text('展示'),
            ),
            FlatButton(
              onPressed: (){
                StatisticData().delete('log');
              },
              child: Text('删除所有数据'),
            ),
            FlatButton(
              onPressed: (){
                StatisticData().deleteTable();
              },
              child: Text('删除表'),
            ),

            FlatButton(
              onPressed: (){
                
                StatisticAction().init();
                print('启动统计');
              },
              child: Text('启动统计'),
            ),
            FlatButton(
              onPressed: (){
                StatisticAction().close();
              },
              child: Text('关闭统计'),
            ),
            FlatButton(
              onPressed: (){
                StatisticAction().readUpdata();
              },
              child: Text('执行上传'),
            ),
            FlatButton(
              onPressed: (){
                StatisticAction().unusualManage();
              },
              child: Text('unusualManage'),
            ),
            FlatButton(
              onPressed: (){
                print(DateTime.now().millisecondsSinceEpoch.toString().substring(0,10));
              },
              child: Text('获取时间'),
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
