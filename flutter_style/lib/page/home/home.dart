import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_style/page/demo/demo.dart';
import 'package:flutter_style/page/mine/mine.dart';
import 'package:flutter_style/page/style/style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  var appBarTitles = ['样式', 'demo', '我的'];
  PageController _homePageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }
  var _pageList = [
    StylePage(),
    DemoPage(),
    MinePage(),
  ];

  bulidBottomBarItem() {
    var tabImages = [
      ['images/style-edit.png', 'images/style-edit_s.png'],
      ['images/changyongshili.png', 'images/changyongshili_s.png'],
      ['images/wode.png', 'images/wode_s.png'],
    ];

    List<BottomNavigationBarItem> bottomBarItem = [];
    for (var i = 0; i < appBarTitles.length; i++) {
      bottomBarItem.add(
        BottomNavigationBarItem(
          icon: Container(
            width: 30,
            height: 30,
            child: Stack(
              children: <Widget>[
                _tabIndex == i
                    ? Positioned(
                        left: 5,
                        top: 4,
                        child: Image.asset(
                          '${tabImages[i][0]}',
                          width: 20,
                          height: 20,
                        ))
                    : Positioned(
                        left: 5,
                        top: 5,
                        child: Image.asset(
                          '${tabImages[i][1]}',
                          width: 20,
                          height: 20,
                        )),
              ],
            ),
          ),
          title: _tabIndex == i
              ? Text(
                  appBarTitles[i],
                  style: new TextStyle(
                    color: const Color(0xff8a8a8a),
                  ),
                )
              : Text(
                  appBarTitles[i],
                  style: new TextStyle(
                    color: const Color(0xffd4237a),
                  ),
                ),
        ),
      );
    }
    return bottomBarItem;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: PageView(
        children: _pageList,
        controller: _homePageController,
        onPageChanged: (a){
          setState(() {
            _tabIndex = a;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: bulidBottomBarItem(),
        onTap: (a) {
          _homePageController.animateToPage(a,duration: Duration(milliseconds: 200),curve: Curves.easeIn);
          setState(() {
            _tabIndex = a;
          });
        },
      ),
    );
  }
}
