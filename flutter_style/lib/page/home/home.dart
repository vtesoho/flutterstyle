import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_style/page/demo/demo.dart';
import 'package:flutter_style/page/style/style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['样式', 'demo'];
  var _pageList;
  PageController homePageController;

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(appBarTitles[curIndex],
          style: TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return Text(appBarTitles[curIndex],
          style: TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('images/home.png'), getTabImage('images/home_selected.png')],
      [getTabImage('images/find.png'), getTabImage('images/find_selected.png')],
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new StylePage(),
      new DemoPage(),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homePageController,
        children: _pageList,
        onPageChanged: (index){
          print('------index');
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          
        ],
      ),
    );
  }
}