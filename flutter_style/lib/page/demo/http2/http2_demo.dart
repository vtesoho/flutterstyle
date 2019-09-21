import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_style/page/demo/http2/bytesToString.dart';
import 'package:flutter_style/page/demo/http2/http2_imageDemo.dart';
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
                  testHttp('https://content.cdn.shuachi.com/note-pic/677901b8bfc8cd323b67bd1b947d5c1f?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=8e26c7693d8a74f1077bd9788c8da809&t=5d7792b0');
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

              GestureDetector(
                onTap: (){
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/7ae97280910d8fbb4942840161b653f6?imageMogr2/auto-orient/thumbnail/x375/gravity/Center/crop/375x375/quality/85&sign=99f0aeead2ed8d2bfee9311c74aa99db&t=5d77c645');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/6e8af1b80f81f2772ac7fb189b8020e2?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=597b6b5960c8d27f75b20981f6643255&t=5d77c257');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/b5c11582144e1817510f0704a33c608b?imageMogr2/auto-orient/thumbnail/x375/gravity/Center/crop/375x375/quality/85&sign=34a4b3b899cff6e274f87b8050bf8678&t=5d77b4e7');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/4d69134d62ca57f0163fa5a9ed04ea99?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=286f7690b5157b6be51965f505e12733&t=5d77c257');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/66ef9074b112dfed8ea1eaf3454edb9c?imageMogr2/auto-orient/thumbnail/x540/gravity/Center/crop/540x540/quality/85&sign=ca34a2a6b71f89898c19709bddd4acb4&t=5d77ba8e');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/66ef9074b112dfed8ea1eaf3454edb9c?imageMogr2/auto-orient/thumbnail/x540/gravity/Center/crop/540x540/quality/85&sign=ca34a2a6b71f89898c19709bddd4acb4&t=5d77ba8e');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/11fb216b5bb8b5da46d2ed71800ac829?imageMogr2/auto-orient/thumbnail/x540/gravity/Center/crop/540x540/quality/85&sign=ff4fbb92192027e39a6d375a4abf1042&t=5d77ba8e');
                  // ImageHttp2Requert().imageRequert('https://content.cdn.shuachi.com/note-pic/a817479b0a81939c1a3d2efc82882f59?imageMogr2/auto-orient/thumbnail/375x/gravity/Center/crop/375x500/quality/85&sign=da486636965866e86e916945bebe24c7&t=5d77a94b');


                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/9eac3fccc6c05938622a775eeca730c61732f2eb.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/0d1ec9e29ff15afb50c5f0e6978633a9b71a65b6.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/df4c612d2362a0ad680a600ea7b024f2e5c72811.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/a81a4cd1390713e4ddc7f0d560bc595f6b52dd60.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/096348ff064cbb02b5763ced9cadbc6a0a75ec28.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/49051b60627c55ad4d34beea7b13268df81915dc.png');
                  // ImageHttp2Requert().imageRequert('https://system.cdn.shuachi.com/icon/eef74782bec8a30b1bd56e20d153cc59bd2cc4d7.png');

                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/weibo@3x.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/pc_dowload_code.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/location.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/shuachibaogao_left.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/shuachibaogao_right.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/like.png');
                  // ImageHttp2Requert().imageRequert('https://www.shuachi.com/shares/web/assets/zipinglunxialajiantou.png');
                },
                child: Container(
                  child: Text('测试连接'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Http2ImageDemo(),
                  ));
                },
                child: Container(
                  child: Text('测试图片'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BytesToString(),
                  ));
                },
                child: Container(
                  child: Text('basic转string'),
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
          if(name == ':status' && value != '200'){
            //返回不为200报错
            print('返回不为200');
          }
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

// class ImageHttp2connectManage {
//   Map<String,ClientTransportConnection> viaSocketList = {};
//   Map<String,num> viaSocketListIndex = {};
//   factory ImageHttp2connectManage(url) => _getInstance(url);
//   int index =0;

//   static ImageHttp2connectManage _instance;
//   ImageHttp2connectManage._internal(url) {
//     // imageRequert(url);
//   }
//   static ImageHttp2connectManage _getInstance(url) {
//     if (_instance == null) {
//       _instance = ImageHttp2connectManage._internal(url);
//     }
//     return _instance;
//   }




//   Future startConnect(url) async{
//     Uri uri = Uri.parse(url);
//     viaSocketListIndex['${uri.host}'] = 0;
//     return Future(()=> handleConnect(url));
//   }

//   Future handleConnect(url) async{
//     Uri uri = Uri.parse(url);

//     for (var i = 0; i < 200; i++) {
//       if(viaSocketListIndex['${uri.host}'] == 0){
//         startConnection(uri.host,uri.port);
        
//         print('-----------${uri.host}');
//       }else{
//         if(viaSocketList['${uri.host}'] != null && viaSocketList['${uri.host}'].isOpen == false){
//           print('---------走这里了吗？');
//           viaSocketListIndex['${uri.host}'] = 0;
//         }
//       }
//       viaSocketListIndex['${uri.host}']++;

//       if(viaSocketList['${uri.host}'] != null && viaSocketList['${uri.host}'].isOpen == true){
//         i=1000;
        
//         return Future(()=> viaSocketList['${uri.host}']);
//         // return Future(()=> 'nnnnn');
//       }
//       print('-----------循环了几次！ $i');
//       await Future.delayed(Duration(milliseconds: 50));
//     }

//   }
  
//   Future reusableConnect(Uri uri) async{
//     if(viaSocketList['${uri.host}'] == null){
//       for (var i = 0; i < 200; i++) {
//         if(viaSocketList['${uri.host}'] != null){
//           i = 1000;
//         }
//         await Future.delayed(Duration(milliseconds: 50));
//         return viaSocketList['${uri.host}'];
//       }
//     }
//   }

//   Future startConnection(host,port) async{
//     viaSocketList['$host'] =ClientTransportConnection.viaSocket(
//       await SecureSocket.connect(
//         host,
//         port,
//         supportedProtocols: ['h2'],
//       ),
//     );
//     print('----------连接了几次？');

//     return Future(() => viaSocketList['$host']);
//   }
// }


// class ImageHttp2Requert{

//   createImage(url,transport) async{
//     var uri = Uri.parse(url);
//     var path = url.replaceAll('${uri.scheme}://${uri.host}', '');
//     var stream = transport.makeRequest(
//       [
//         new Header.ascii(':method', 'GET'),
//         new Header.ascii(':path', path),
//         new Header.ascii(':scheme', uri.scheme),
//         new Header.ascii(':authority', uri.host),
//       ],
//       endStream: true,
//     );
    
//     // stream.incomingMessages.join()

//     final Completer<Uint8List> completer = Completer<Uint8List>.sync();
//     final List<List<int>> chunks = <List<int>>[];
//     int contentLength = 0;

//     await for (var message in stream.incomingMessages) {
//       if (message is HeadersStreamMessage) {
//         for (var header in message.headers) {
          
//           var name = utf8.decode(header.name);
//           var value = utf8.decode(header.value);
//           if(name == ':status' && value != '200'){
//             //返回不为200报错
//             print('返回不为200');
//           }
//           print('Header: $name: $value');
//         }
//       } else if (message is DataStreamMessage) {
//         print('-------message $message');
//         var bytes = message.bytes;
//         chunks.add(bytes);
//         contentLength += bytes.length;
//       }
//     }

//     final Uint8List bytes = Uint8List(contentLength);
//     int offset = 0;
//     for (List<int> chunk in chunks) {
//       bytes.setRange(offset, offset + chunk.length, chunk);
//       offset += chunk.length;
//     }
//     completer.complete(bytes);
//     print(bytes);
    
//   }

//   imageRequert(url) async{
//     ClientTransportConnection connect;
//     connect = await ImageHttp2connectManage(url).startConnect(url).then((onValue){
//       connect = onValue;
//       createImage(url,connect);
      
//       print('-----------测试connect返回 ${connect.isOpen}');
//     });
    
//     var uri = Uri.parse(url);
    
      
    
//     var path = url.replaceAll('${uri.scheme}://${uri.host}', '');

//     // var stream = connect.makeRequest(
//     //   [
//     //     new Header.ascii(':method', 'GET'),
//     //     new Header.ascii(':path', path),
//     //     new Header.ascii(':scheme', uri.scheme),
//     //     new Header.ascii(':authority', uri.host),
//     //   ],
//     //   endStream: true,
//     // );
//     // final Completer<Uint8List> completer = Completer<Uint8List>.sync();
//     // final List<List<int>> chunks = <List<int>>[];
//     // int contentLength = 0;

//     // await for (var message in stream.incomingMessages) {
//     //   if (message is HeadersStreamMessage) {
//     //     for (var header in message.headers) {
//     //       var name = utf8.decode(header.name);
//     //       var value = utf8.decode(header.value);
//     //       if(name == ':status' && value != '200'){
//     //         //返回不为200报错
//     //         print('返回不为200');
//     //       }
//     //       // print('Header: $name: $value');
//     //     }
//     //   } else if (message is DataStreamMessage) {
        
//     //     var bytes = message.bytes;
//     //     print('-------message $message bytes ${bytes.length}');
//     //     chunks.add(bytes);
//     //     contentLength += bytes.length;
//     //   }
//     // }

//     // final Uint8List bytes = Uint8List(contentLength);
//     // int offset = 0;
//     // for (List<int> chunk in chunks) {
//     //   bytes.setRange(offset, offset + chunk.length, chunk);
//     //   offset += chunk.length;
//     // }
//     // completer.complete(bytes);
//     // return completer.future;
    
//   }

// }