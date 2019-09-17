// import 'dart:io';

// import 'package:angel_framework/http.dart';
// import 'package:angel_framework/http2.dart';
// import 'package:flutter/material.dart';
// import 'package:angel_framework/angel_framework.dart';
// import 'package:logging/logging.dart';

// class Http2Demo2 extends StatefulWidget {
//   Http2Demo2({Key key}) : super(key: key);

//   _Http2Demo2State createState() => _Http2Demo2State();
// }

// class _Http2Demo2State extends State<Http2Demo2> {
//   void dumpError(LogRecord rec) {
//   print(rec);
//   if (rec.error != null) print(rec.error);
//   if (rec.stackTrace != null) print(rec.stackTrace);
// }
//   testhttp2() async {
//       print('testhttp2');
//       var app = Angel()
//         ..encoders.addAll({
//           'gzip': gzip.encoder
//         });
//       app.logger = Logger('angel')..onRecord.listen(dumpError);

//       app.get('https://www.ssssdf.com/cate/newfood5O68.html', (req, res) {
//         print(req);
//         print(res);
//       });

//       app.fallback((req, res) => throw AngelHttpException.notFound(
//           message: 'No file exists at ${req.uri}'));

//       var ctx = SecurityContext();

//       try {
//         ctx.setAlpnProtocols(['h2'], true);
//       } catch (e, st) {
//         app.logger.severe(
//           'Cannot set ALPN protocol on server to `h2`. The server will only serve HTTP/1.x.',
//           e,
//           st,
//         );
//       }
//       print(app);
//       var http1 = AngelHttp(app);
//       // http1.req
//       var http2 = AngelHttp2(app, ctx);
//       http2.onHttp1.listen(http1.handleRequest);

//       // // HTTP/1.x requests will fallback to `AngelHttp`
//       // http2.onHttp1.listen(http1.handleRequest);

//       var server = await http2.startServer('127.0.0.1', 3000);
//       print('Listening at https://${server.address.address}:${server.port}');
//       // // http2.createRequestContext(request, response)

      
//       // print('Listening at ${http2.uri}');
//   }

//   cloneHttp2(AngelHttp2 http2){
//     http2.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('http2 angle'),
//       ),
//       body: Container(
//         child: Wrap(
//           children: <Widget>[
//             GestureDetector(
//               onTap: (){
//                 testhttp2();
//               },
//               child: Container(
//                 child: Text('测试http2'),
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 testhttp2();
//               },
//               child: Container(
//                 child: Text('关闭http2'),
//                 width: 100,
//                 height: 100,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }