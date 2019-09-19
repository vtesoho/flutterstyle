import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class InWebview extends StatefulWidget {
  InWebview({Key key}) : super(key: key);

  _InWebviewState createState() => _InWebviewState();
}

class _InWebviewState extends State<InWebview> {
  InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inWebview'),
      ),
      body: Container(
        child: ,
      ),
    );
  }
}