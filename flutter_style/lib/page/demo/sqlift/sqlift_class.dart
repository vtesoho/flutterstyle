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
        await db.execute('CREATE TABLE log (key TEXT, value TEXT)');
      });
    }
    var b = await SqlManager.isTableExits('loga');
    if(!b){
      await SqlManager.getCurrentDatabase().then((db) async{
        await db.execute('CREATE TABLE loga (key TEXT, value TEXT)');
      });
    }
    await SqlManager.close();
  }

  insert(String key,String value,String tableName) async {
    print(DateTime.now());
    SqlManager.getCurrentDatabase().then((db) async {
      await db.execute("INSERT INTO $tableName (key, value) VALUES ('$key', '$value')");
      // await db.execute('INSERT INTO "log" ("key","value") VALUES ("111","222")');
      await SqlManager.close();
      print(DateTime.now());
    });
  }

  select(String tableName) async{
    // print(DateTime.now());
    var data;
    await SqlManager.getCurrentDatabase().then((db) async {
      data = await db.rawQuery('SELECT key, value FROM $tableName;');
      await SqlManager.close();
      // print(DateTime.now());
    });
    return data;
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

  init(){
    if(time != null){
      time = Timer.periodic(Duration(seconds: cycleTime), (time){
        print('-adsfsfdsfdsf');
      });
    }
  }

  format() async{
    var a = await StatisticData().select('log');
    if(a.length > 0){
      print(a);
    }
  }

  close(){
    time.cancel();
  }

}