import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HttpPrefix extends StatefulWidget {
  HttpPrefix({Key key}) : super(key: key);

  @override
  _HttpPrefixState createState() => _HttpPrefixState();
}

class _HttpPrefixState extends State<HttpPrefix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('httpPrefix'),
      ),
      body: Container(
        child: Text('data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var url = 'https://content.cdn.shuachi.com/note-pic/cf6d86bcbb4a1451175b18b99392eb90?imageMogr2/auto-orient/thumbnail/x375/gravity/Center/crop/375x375/quality/85&sign=9575f77c1e40a2674ce7667d321b6769&t=5dc7eefe';
          var uri = Uri.parse(url);
          var ls = url.replaceAll('${uri.scheme}://', '');
          var arr = ls.split('.');
          var path = await getFilePath();

          final dir = Directory('$path/${arr[0]}');
          var pathExists = await  dir.exists();
          if(pathExists){
            dir.createSync();
          }

          print('------path ${arr[0]} dirpath ${dir.path}');
        },
      ),
    );
  }

  Future<String> getFilePath() async {
  var directory;
  if(defaultTargetPlatform == TargetPlatform.iOS){
    directory = await getTemporaryDirectory();
  }else{
    directory = await getApplicationDocumentsDirectory();
  }
  
  return directory.path;
}
}