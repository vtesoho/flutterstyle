import 'dart:convert';
import 'dart:io';

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
                  testHttp();
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
           ],
         ),
       ),
    );
  }

  showHttp() async {
    print('----------transport.isOpen ${transport.isOpen}');
  }

  finishHttp() async{
    await transport.finish();
  }

  testHttp() async{
    var uri = Uri.parse('https://www.shuachi.com/cate/newfood5O68.html');
    
    transport = new ClientTransportConnection.viaSocket(
      await SecureSocket.connect(
        uri.host,
        uri.port,
        supportedProtocols: ['h2'],
      ),
    );

    

    
    
    transport.ping().then((onValue){
      print('------------onvalue $onValue');
    });
    print('-------------url $transport ping ${uri.scheme}');
    
    var stream = transport.makeRequest(
      [
        new Header.ascii(':method', 'GET'),
        new Header.ascii(':path', uri.path),
        new Header.ascii(':scheme', uri.scheme),
        new Header.ascii(':authority', uri.host),
      ],
      endStream: true,
    );
    

    await for (var message in stream.incomingMessages) {
      if (message is HeadersStreamMessage) {
        for (var header in message.headers) {
          var name = utf8.decode(header.name);
          var value = utf8.decode(header.value);
          print('Header: $name: $value');
        }
      } else if (message is DataStreamMessage) {
        // Use [message.bytes] (but respect 'content-encoding' header)
      }
    }

    // await transport.finish();
  }





}