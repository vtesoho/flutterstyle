import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http2/http2.dart';
class HttpDemo extends StatefulWidget {
  HttpDemo({Key key}) : super(key: key);

  _HttpDemoState createState() => _HttpDemoState();
}


class _HttpDemoState extends State<HttpDemo> {
  ClientTransportConnection transport;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('http2 Demo'),
       ),
       body: Container(
         child: Wrap(
           children: <Widget>[
              GestureDetector(
                onTap: (){
                  testHttp('https://content.cdn.shuachi.com/note-pic/5f2fad6d6da815ca9b871561824a255d?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=33872647a7de2268185a0e535fb2e91d&t=5d774eff');
                  // testHttp('https://system.cdn.shuachi.com/icon/9eac3fccc6c05938622a775eeca730c61732f2eb.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/0d1ec9e29ff15afb50c5f0e6978633a9b71a65b6.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/df4c612d2362a0ad680a600ea7b024f2e5c72811.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/a81a4cd1390713e4ddc7f0d560bc595f6b52dd60.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/096348ff064cbb02b5763ced9cadbc6a0a75ec28.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/49051b60627c55ad4d34beea7b13268df81915dc.png');
                  // testHttp('https://system.cdn.shuachi.com/icon/eef74782bec8a30b1bd56e20d153cc59bd2cc4d7.png');

                },
                child: Container(
                  child: Text('连接http2'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  finishHttp();
                },
                child: Container(
                  child: Text('关闭http2'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showHttp();
                },
                child: Container(
                  child: Text('打印http2'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  testJoin();
                },
                child: Container(
                  child: Text('测试合并'),
                ),
              ),
              imageBytes != null ? Image.memory(imageBytes) : Text('data'),
              // Image.network("https://system.cdn.shuachi.com/icon/a81a4cd1390713e4ddc7f0d560bc595f6b52dd60.png"),
              // Image.memory(bytes)
           ],
         ),
       ),
    );
  }

  testJoin() async {
    print('测试合并');
    List<int> list = [];
    var list1 = [2,3,4,5,6];
    list.addAll(list1);
    print(list);
  }

  showHttp() async {
    print('----------transport.isOpen ${transport.isOpen}');
  }

  finishHttp() async{
    await transport.finish();
  }

  var imageBytes;

  List textbytes = [];
  final Completer<Uint8List> completer = Completer<Uint8List>.sync();

  testHttp(String url) async{
    // var uri = Uri.parse('$url');
    
    var uri = Uri.parse(url);
    
    
    transport = new ClientTransportConnection.viaSocket(
      await SecureSocket.connect(
        uri.host,
        uri.port,
        supportedProtocols: ['h2'],
      ),
    );
    var path = url.replaceAll('${uri.scheme}://${uri.host}', '');
    print('-------------url $transport ping ${uri.scheme}--- url ${uri.host}--- path $path');
    
    var stream = transport.makeRequest(
      [
        new Header.ascii(':method', 'GET'),
        new Header.ascii(':path', path),
        new Header.ascii(':scheme', uri.scheme),
        new Header.ascii(':authority', uri.host),
      ],
      endStream: true,
    );
    
    // stream.incomingMessages.join()

    final Completer<Uint8List> completer = Completer<Uint8List>.sync();
    final List<List<int>> chunks = <List<int>>[];
    int contentLength = 0;

    await for (var message in stream.incomingMessages) {
      if (message is HeadersStreamMessage) {
        for (var header in message.headers) {
          
          var name = utf8.decode(header.name);
          var value = utf8.decode(header.value);
          print('Header: $name: $value');
        }
      } else if (message is DataStreamMessage) {
        print('-------message $message');
        var bytes = message.bytes;
        chunks.add(bytes);
        contentLength += bytes.length;
      }
    }

    final Uint8List bytes = Uint8List(contentLength);
    int offset = 0;
    for (List<int> chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    completer.complete(bytes);

    imageBytes = bytes;
    setState(() {
      
    });
    // PaintingBinding.instance.instantiateImageCodec(bytes);
    // print(bytes is Uint8List);

    // var streamb = transport.makeRequest(
    //   [
    //     new Header.ascii(':method', 'GET'),
    //     new Header.ascii(':path', '/note-pic/b422fc834aa438032f2d850a5c048722?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=29d45e8d535ea1971d240d8d21bf2b7f&t=5d765e35'),
    //     new Header.ascii(':scheme', uri.scheme),
    //     new Header.ascii(':authority', uri.host),
    //   ],
    //   endStream: true,
    // );
    
    // // stream.incomingMessages.join()
    // await for (var message in streamb.incomingMessages) {
    //   if (message is HeadersStreamMessage) {
    //     for (var header in message.headers) {
          
    //       var name = utf8.decode(header.name);
    //       var value = utf8.decode(header.value);
    //       print('Header: $name: $value');
    //     }
    //   } else if (message is DataStreamMessage) {
    //     print('-------messageb $message');
    //     print(message.bytes);

    //     // Use [message.bytes] (but respect 'content-encoding' header)
    //   }
    // }

    // var uri1 = Uri.parse('https://content.cdn.shuachi.com/note-pic/e543aa6619fbd19eb34f669bdb9f66fa?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=30ae7d3cb6a3f2fdc8227333ce899b21&t=5d7622ba');

    // var streama = transport.makeRequest(
    //   [
    //     new Header.ascii(':method', 'GET'),
    //     new Header.ascii(':path', uri1.path),
    //     new Header.ascii(':scheme', uri1.scheme),
    //     new Header.ascii(':authority', uri1.host),
    //   ],
    //   endStream: true,
    // );
    
    // // stream.incomingMessages.join()
    // await for (var messagea in streama.incomingMessages) {
    //   if (messagea is HeadersStreamMessage) {
    //     for (var header in messagea.headers) {
          
    //       var name = utf8.decode(header.name);
    //       var value = utf8.decode(header.value);
    //       print('Header: $name: $value');
    //     }
    //   } else if (messagea is DataStreamMessage) {
    //     print(messagea);
    //     print(messagea.bytes);
    //     // Use [message.bytes] (but respect 'content-encoding' header)
    //   }
    // }
    

    // await transport.finish();
  }





}