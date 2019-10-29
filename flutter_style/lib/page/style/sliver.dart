// import 'package:flutter/material.dart';

// class SliverDemo extends StatefulWidget {
//   SliverDemo({Key key}) : super(key: key);

//   @override
//   _SliverDemoState createState() => _SliverDemoState();
// }

// class _SliverDemoState extends State<SliverDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: _sliverBuilder,
//         body: Center(
//           child: ListView.builder(
//             itemBuilder: _itemBuilder,
//             itemCount: 15,
//           ),
//         ),

//       )
//     );
//   }


//   List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
//     return <Widget>[
//       SliverAppBar(
//         centerTitle: true,    //标题居中
//         expandedHeight: 200.0,  //展开高度200
//         floating: false,  //不随着滑动隐藏标题
//         pinned: true,    //固定在顶部
//         flexibleSpace: FlexibleSpaceBar(
//           centerTitle: true,
//           // title: Text('我是一个FlexibleSpaceBar'),
//           background: Image.network(
//             "https://pics6.baidu.com/feed/50da81cb39dbb6fde6e05400f05a011d962b37e5.jpeg?token=cca0e8255f3cf0b24a25205bf657bd45&s=0E5178840D41894110C7959F0300F08B",
//             fit: BoxFit.cover,
//           ),
//         ),
//       )
//     ];
//   }

// Widget _itemBuilder(BuildContext context, int index) {
//   return ListTile(
//     leading: Icon(Icons.android),
//     title: Text('无与伦比的标题+$index'),
//   );
// }



// }


import 'package:flutter/material.dart';

class SliverDemo extends StatefulWidget {
  SliverDemo({Key key}) : super(key: key);

  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar( // 类似AppBar，但是可以设置滚动效果
            // title: Text('动画'), // 导航栏标题
           pinned: true, // 设置为true就会固定在顶部
            // floating: true, // 下拉显示效果
            expandedHeight: 178.0, // 设置顶部向下伸展的高度
            flexibleSpace: FlexibleSpaceBar( // 向下伸展的部分
              title: Text('你好，欢迎光临！', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
              background: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560266593833&di=96dc58ad2f09d707173a045c83026803&imgtype=0&src=http%3A%2F%2Fpic33.nipic.com%2F20131014%2F13419492_181704251155_2.jpg',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.none,
            ),
          ),
          SliverSafeArea( // 让内容显示在安全区域内
            sliver: SliverPadding( // 添加内边距
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          ),

        ],
      ),
    );
  }
  

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid( // 构建网格视图
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, // 控制网格视图项目显示的比例
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            child: ListTile(
              leading: Icon(Icons.android),
              title: Text('无与伦比的标题+$index'),
            ),
          );
        },
        childCount: 30,
      ),
    );
  }
}