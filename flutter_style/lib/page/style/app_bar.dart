import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key key}) : super(key: key);

  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double elevation = 0.0;
  bool leading = false;
  String title = 'AppBar';
  List<Widget> actions;
  int actionsRadio = 0;
  var backgroundColor;
  int backgroundColorRadio = 0;
  var brightness;
  int brightnessRadio = 0;
  var controller;
  bool centerTitle;
  double toolbarOpacity = 1.0;
  Widget bottomWidget;
  bool bottomSwitch;
  // int centerTitleRadio = 0;
  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
        // leading: leading,
        automaticallyImplyLeading: leading, //去除默认返回按钮
        title: Text('${title}'),
        elevation: elevation, //阴影
        actions: actions,
        centerTitle: centerTitle,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('data'),
        ),
        // flexibleSpace: flexibleSpace(),
        bottom: bottomWidget,
        // titleSpacing: 0,
        backgroundColor: backgroundColor,
        brightness: brightness,
        toolbarOpacity: toolbarOpacity,
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              elevationChange(),
              Divider(),
              leadingChange(),
              Divider(),
              titleChange(),
              Divider(),
              actionsChange(),
              Divider(),
              backgroundColorChange(),
              Divider(),
              brightnessChange(),
              Divider(),
              centerTitleChange(),
              Divider(),
              toolbarOpacityChange(),
              Divider(),
              bottomChange(),
              Divider(),
              // TabBarView(
              //   controller: controller,
              //   children: <Widget>[
              //     Container(child: Text('data'),),
              //     Container(child: Text('data1'),),
              //     Container(child: Text('data2'),),
              //   ],
              // )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Container(child: Text('data'),),
          Container(child: Text('data1'),),
          Container(child: Text('data2'),),
        ],
      ),
      floatingActionButton: Builder(builder: (context) {
        return GestureDetector(
          onTap: (){
            Scaffold.of(context).openDrawer(); //打开结束方向抽屉布局
          },
          child: Container(
            child: Text('修改配置'),
          ),
        );
      }),
    );
  }

  
  Widget bottomChange(){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('显示bottom'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Radio(
                value: true,
                groupValue: bottomSwitch,
                onChanged: (bool val) {
                  bottomSwitch = val;
                  bottomWidget = TabBar(
                    controller: controller,
                    tabs: <Tab>[
                      Tab(text: "tab1",),
                      Tab(text: "tab2",),
                      Tab(text: "tab3",),
                    ]
                  );
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('显示'),
              Radio(
                value: false,
                groupValue: bottomSwitch,
                onChanged: (bool val) {
                  print(val.toString());
                  bottomWidget = null;
                  bottomSwitch = val;
                  setState(() {});
                },
              ),
              Text('不显示'),
            ],
          ),
        ),
      ],
    );
  }

  Widget centerTitleChange(){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('标题居中'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Radio(
                value: true,
                groupValue: centerTitle,
                onChanged: (bool val) {
                  centerTitle = val;
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('居中'),
              Radio(
                value: false,
                groupValue: centerTitle,
                onChanged: (bool val) {
                  print('${val}');
                  centerTitle = val;
                  setState(() {});
                },
              ),
              Text('不居中 '),
            ],
          ),
        ),
      ],
    );
  }

  Widget toolbarOpacityChange(){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('设置导航透明'),
        ),
        Expanded(
          flex: 3,
          child: Slider(
            value: toolbarOpacity,
            max: 1.0,
            min: 0.0,
            onChanged: (double val) {
              setState(() {
                toolbarOpacity = val;
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('${toolbarOpacity.toStringAsFixed(2)}'),
        )
      ],
    );
  }

  Widget brightnessChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('bar图标颜色'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: brightnessRadio,
                onChanged: (int val) {
                  brightnessRadio = val;
                  brightness = Theme.of(context).primaryColorBrightness;
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('默认'),
              Radio(
                value: 1,
                groupValue: brightnessRadio,
                onChanged: (int val) {
                  print('${val}');
                  brightnessRadio = val;
                  brightness = Brightness.dark;
                  setState(() {});
                },
              ),
              Text('白色'),
            ],
          ),
        ),
      ],
    );
  }

  Widget backgroundColorChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('背景颜色'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: backgroundColorRadio,
                onChanged: (int val) {
                  backgroundColorRadio = val;
                  backgroundColor = Theme.of(context).primaryColor;
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('默认'),
              Radio(
                value: 1,
                groupValue: backgroundColorRadio,
                onChanged: (int val) {
                  print('${val}');
                  backgroundColorRadio = val;
                  backgroundColor = Colors.red;
                  setState(() {});
                },
              ),
              Text('红色'),
              Radio(
                value: 2,
                groupValue: backgroundColorRadio,
                onChanged: (int val) {
                  print('${val}');
                  backgroundColorRadio = val;
                  backgroundColor = Colors.yellow;
                  setState(() {});
                },
              ),
              Text('黄色'),
            ],
          ),
        ),
      ],
    );
  }

  Widget flexibleSpace() {
    return Container(
      height: 200,
      color: Colors.red,
      child: Text('data'),
    );
  }

  Widget actionsChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('右边按纽区域'),
        ),
        Expanded(
          flex: 4,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: actionsRadio,
                onChanged: (val) {
                  actionsRadio = val;
                  actions = actionChangeItemOne();
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('一个按纽'),
              Radio(
                value: 2,
                groupValue: actionsRadio,
                onChanged: (val) {
                  print('${val}');
                  actionsRadio = val;
                  actions = actionChangeItemMore();
                  setState(() {});
                },
              ),
              Text('多个按纽'),
              Radio(
                value: 3,
                groupValue: actionsRadio,
                onChanged: (val) {
                  actionsRadio = val;
                  actions = actionChangeItemPopup();
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('弹出按纽'),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> actionChangeItemOne() {
    List<Widget> data = [];
    data.add(
      Icon(Icons.edit),
    );
    return data;
  }

  List<Widget> actionChangeItemMore() {
    List<Widget> data = [];
    data.add(
      Icon(Icons.edit),
    );
    data.add(
      Icon(Icons.map),
    );
    data.add(
      Icon(Icons.email),
    );
    return data;
  }

  List<Widget> actionChangeItemPopup() {
    List<Widget> data = [];
    data.add(
      PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                PopupMenuItem(value: "选项一的内容", child: new Text("选项一")),
                PopupMenuItem(value: "选项二的内容", child: new Text("选项二"))
              ]),
    );
    return data;
  }

  Widget titleChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('标题'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      title = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(''),
        )
      ],
    );
  }

  Widget leadingChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('左边返回区域'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Radio(
                value: false,
                groupValue: leading,
                onChanged: (bool val) {
                  leading = val;
                  print('${val}');
                  setState(() {});
                },
              ),
              Text('不显示'),
              Radio(
                value: true,
                groupValue: leading,
                onChanged: (bool val) {
                  print('${val}');
                  leading = val;
                  setState(() {});
                },
              ),
              Text('显示'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(''),
        )
      ],
    );
  }

  Widget elevationChange() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('设置阴影'),
        ),
        Expanded(
          flex: 3,
          child: Slider(
            value: elevation,
            max: 100.0,
            min: 0.0,
            onChanged: (double val) {
              setState(() {
                elevation = val;
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('${elevation.toStringAsFixed(2)}'),
        )
      ],
    );
  }
}

