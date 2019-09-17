import 'package:flutter/material.dart';

class Http2ImageDemo extends StatelessWidget {
  const Http2ImageDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http2Image'),
      ),
      body: ListView(
        children: <Widget>[
          
          
          Image.network('https://system.cdn.shuachi.com/icon/9eac3fccc6c05938622a775eeca730c61732f2eb.png'),
          Image.network('https://system.cdn.shuachi.com/icon/0d1ec9e29ff15afb50c5f0e6978633a9b71a65b6.png'),
          Image.network('https://system.cdn.shuachi.com/icon/df4c612d2362a0ad680a600ea7b024f2e5c72811.png'),
          Image.network('https://system.cdn.shuachi.com/icon/a81a4cd1390713e4ddc7f0d560bc595f6b52dd60.png'),
          Image.network('https://system.cdn.shuachi.com/icon/096348ff064cbb02b5763ced9cadbc6a0a75ec28.png'),
          Image.network('https://system.cdn.shuachi.com/icon/49051b60627c55ad4d34beea7b13268df81915dc.png'),
          Image.network('https://system.cdn.shuachi.com/icon/eef74782bec8a30b1bd56e20d153cc59bd2cc4d7.png'),

          Image.network('https://www.shuachi.com/shares/web/assets/weibo@3x.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/pc_dowload_code.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/location.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/shuachibaogao_left.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/shuachibaogao_right.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/like.png'),
          Image.network('https://www.shuachi.com/shares/web/assets/zipinglunxialajiantou.png'),
          
        ],
      ),
    );
  }
}