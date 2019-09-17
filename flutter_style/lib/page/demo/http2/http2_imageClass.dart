// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:http2/http2.dart';

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
//     return completer.future;
//     print(bytes);
    
//   }

//   void imageRequert(String url) async{
//     ClientTransportConnection connect;
//     connect = await ImageHttp2connectManage(url).startConnect(url).then((onValue) async {
//       connect = onValue;
//       print('-----------测试connect返回 ${connect.isOpen}');
//       var completer = await createImage(url,connect);
//       return completer;
      
//     });
    
//     // var uri = Uri.parse(url);
    
      
    
//     // var path = url.replaceAll('${uri.scheme}://${uri.host}', '');

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