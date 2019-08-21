import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class SqlManager{

  static const _VERSION=1;

  static const _NAME="test.db";

  static Database _database;


  ///初始化
  static init() async {
    var databasesPath=await getDatabasesPath();

    String path = join(databasesPath, _NAME);

    _database=await openDatabase(path,version: _VERSION,onCreate: (Database db,int version) async{});
  }

  ///判断表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res=await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res!=null && res.length >0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if(_database == null){
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }
}

class StatisticData{

  init() async{
    var a = await SqlManager.isTableExits('log');
    if(!a){
      await SqlManager.getCurrentDatabase().then((db) async{
        print('创建表动作');
        await db.execute('CREATE TABLE log (id INTEGER PRIMARY KEY AUTOINCREMENT,key TEXT, value TEXT,session Text )');
      });
    }
    await SqlManager.close();
  }

  deleteTable() async{
    var a = await SqlManager.isTableExits('log');
    if(!a) return;
    await SqlManager.getCurrentDatabase().then((db) async{
      print('删除表动作');
      await db.rawQuery('DROP TABLE log;');
      await SqlManager.close();
    });
  }

  insert(String key,String value,String session,String tableName) async {
    // print(DateTime.now());
    SqlManager.getCurrentDatabase().then((db) async {
      await db.execute("INSERT INTO $tableName (key, value,session) VALUES ('$key', '$value','$session')");
      // await db.execute('INSERT INTO "log" ("key","value") VALUES ("111","222")');
      await SqlManager.close();
      print('插入成功');
    });
  }

  Future select(String tableName,{field}) async{
    var a = await SqlManager.isTableExits(tableName);
    var data;
    if(a) {
      Database db = await SqlManager.getCurrentDatabase();
      if(field == null){
        data = await db.query('$tableName',columns:['key','value','session']);
      }else{
        data = await db.rawQuery('SELECT $field FROM $tableName;');
      }
      return data;
    }
  }

  delete(String tableName) async{
    
    SqlManager.getCurrentDatabase().then((db) async {
      var s = await db.delete('$tableName');
      print(s);
      await SqlManager.close();
    });
  }
}


class StatisticAction{
  var cycleTime = 5;
  Timer time;
  String tableName = 'log';
  var newSession;

  static StatisticAction _instance;
  factory StatisticAction() => _getInstance();
  StatisticAction._internal();
  static StatisticAction _getInstance() {
    if (_instance == null) {
      _instance = StatisticAction._internal();
    }
    return _instance;
  }
  //初始化
  init() async {
    var a = await SqlManager.isTableExits('log');
    if(!a){
      await SqlManager.getCurrentDatabase().then((db) async{
        print('创建表动作');
        await db.execute('CREATE TABLE log (id INTEGER PRIMARY KEY AUTOINCREMENT,key TEXT, value TEXT,session Text )');
      });
    }
    await SqlManager.close();
    // 此处获取会话id
    newSession = 55;
    if(time == null){
      time = Timer.periodic(Duration(seconds: cycleTime), (data){
        readUpdata();
      });
      print('init $time');
    }
  }

  //读取上传动作
  readUpdata() async {
    Database db = await SqlManager.getCurrentDatabase();
    //上次异常退出没有上传的log
    unusualManage();
    //此次会话id上传的log
    var lastData = await db.rawQuery('SELECT id FROM $tableName WHERE session = $newSession ORDER BY id desc LIMIT 1;');
    if(lastData.length > 0){
      //保存数组最后一个的id
      var lastId = lastData[0]['id'];
      print('lastId $lastId');
      var data = await db.rawQuery('SELECT key,value FROM $tableName WHERE id <= $lastId AND session = $newSession;');
      bool updataStatus = true;
      //执行上传动作成功，删除已经读取出来的数据
      if(updataStatus) {
        db.rawDelete('DELETE FROM $tableName WHERE id <= $lastId AND session = $newSession');
      }else{
        print('删除失败');
      }
      print(data);
    }else{
      print('没有数据，不需要上传');
    }
    await SqlManager.close();
  }

  unusualManage() async{
    Database db = await SqlManager.getCurrentDatabase();
    var data = await db.rawQuery('SELECT * FROM $tableName WHERE id IN (SELECT MAX(id) FROM $tableName GROUP BY session) AND session < $newSession ;');
    if(data.length > 0){
      for (var i = 0; i < data.length; i++) {
        itemSession(data[i]['session']);
      }
    }else{
      print('没有其它会话需要上传的log');
    }
  }

  //通过session查找其它没有上传的条目。
  itemSession(session) async {
    Database db = await SqlManager.getCurrentDatabase();
    var data = await db.rawQuery('SELECT key,value FROM $tableName WHERE session = $session;');
    print(data);
    bool updataStatus = true;
    //执行上传动作成功，删除已经读取出来的数据
    if(updataStatus) {
      db.rawDelete('DELETE FROM $tableName WHERE session = $session');
    }else{
      print('删除失败');
    }
  }



  close(){
    print(time);
    if(time != null){
      time.cancel();
      time = null;
    }
  }

  add(index,arguments) async{
    Database db = await SqlManager.getCurrentDatabase();
    await db.execute("INSERT INTO $tableName (key, value,session) VALUES ('$index', '$arguments','$newSession')");
    await SqlManager.close();
    print('插入成功');
    // SqlManager.getCurrentDatabase().then((db) async {
    //   await db.execute("INSERT INTO $tableName (key, value,session) VALUES ('$key', '$value','$session')");
    //   // await db.execute('INSERT INTO "log" ("key","value") VALUES ("111","222")');
    //   await SqlManager.close();
    //   print('插入成功');
    // });
  }

}