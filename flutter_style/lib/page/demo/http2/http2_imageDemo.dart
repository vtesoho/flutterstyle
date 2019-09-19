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
          
          // Image.network('https://content.cdn.shuachi.com/note-pic/51e5e7038cb5f2e2c4125fbe17142a59?imageMogr2/auto-orient/thumbnail/x375/gravity/Center/crop/375x375/quality/85&sign=06ca5bad8be8d269c3123bc938c58970&t=5d830a7b'),
          Image.network('https://www.shuachi.com/apps/v2/note/poster-img?note_id=10117&path=commonPage%2FcardDetailPage%2FcardDetailPage&sid=session.1644999058558699&sign=&device_id=F5D2840C-9F28-4878-A783-50A3AE467F92&version=2.5.0'),
          // Image.network('https://user.cdn.shuachi.com/avatar/bb481717cb4d436343f622f2aa06b4d6'),
          // Image.network('https://system.cdn.shuachi.com/icon/9eac3fccc6c05938622a775eeca730c61732f2eb.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/0d1ec9e29ff15afb50c5f0e6978633a9b71a65b6.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/df4c612d2362a0ad680a600ea7b024f2e5c72811.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/a81a4cd1390713e4ddc7f0d560bc595f6b52dd60.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/096348ff064cbb02b5763ced9cadbc6a0a75ec28.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/49051b60627c55ad4d34beea7b13268df81915dc.png'),
          // Image.network('https://system.cdn.shuachi.com/icon/eef74782bec8a30b1bd56e20d153cc59bd2cc4d7.png'),

          // Image.network('https://www.shuachi.com/shares/web/assets/weibo@3x.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/pc_dowload_code.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/location.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/shuachibaogao_left.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/shuachibaogao_right.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/like.png'),
          // Image.network('https://www.shuachi.com/shares/web/assets/zipinglunxialajiantou.png'),
          
        ],
      ),
    );
  }
}