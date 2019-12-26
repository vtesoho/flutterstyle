import 'package:flutter/material.dart';
import 'package:flutter_style/page/demo/async_demo.dart';
import 'package:flutter_style/page/demo/circularReveal/reveal.dart';
import 'package:flutter_style/page/demo/http2/http2_demo.dart';
import 'package:flutter_style/page/demo/http2/http2_demo2.dart';
import 'package:flutter_style/page/demo/httpPrefix.dart';
import 'package:flutter_style/page/demo/ios13keycarth.dart';
import 'package:flutter_style/page/demo/listviewCrashe.dart';
import 'package:flutter_style/page/demo/listviewpageview.dart';
import 'package:flutter_style/page/demo/mixinWebView.dart';
import 'package:flutter_style/page/demo/scanqr.dart';
import 'package:flutter_style/page/demo/sqlift/sqlift_demo.dart';
import 'package:flutter_style/page/demo/testAlign.dart';
import 'package:flutter_style/page/demo/testDemo/listViewText.dart';
import 'package:flutter_style/page/demo/webview/inWebview.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Wrap(
        children: <Widget>[
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AsyncDemo(),
            ));},
            'async',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SqliftDemo(),
            ));},
            'sqlift',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HttpDemo(),
            ));},
            'HttpDemo',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InWebview(),
            ));},
            'webview',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IoskeyCrach(),
            ));},
            'ios13crach',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPageView(),
            ));},
            'ListPageView',
          ),


          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListViewTextDemo(),
            ));},
            'ListViewTextDemo',
          ),

          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListviewCrasheDemo(),
            ));},
            'ListViewTextDemo',
          ),

          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SacnBody(),
            ));},
            'SacnBody',
          ),

          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HttpPrefix(),
            ));},
            'HttpPrefix',
          ),
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestTextAlign(),
            ));},
            'TestTextAlign',
          ),

          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reveal(),
            ));},
            'Reveal',
          ),


          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MixinWebView(),
            ));},
            'MixinWebView',
          ),
          

          


          

          

          
          // styleItem(
          //   (){Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Http2Demo2(),
          //   ));},
          //   'HttpDemo2',
          // ),
          // Image.network(src)
        ],
      ),
    );
  }



  Widget styleItem(jumpClass,title){
    return GestureDetector(
      onTap: () {
        jumpClass();
      },
      child: Container(
        color: Colors.red,
        child: Text('${title}'),
        width: 50,
        height: 50,
      ),
    );
  }

}