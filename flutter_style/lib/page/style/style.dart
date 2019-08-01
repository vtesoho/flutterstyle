import 'package:flutter/material.dart';

class StylePage extends StatefulWidget {
  StylePage({Key key}) : super(key: key);

  _StylePageState createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('样式'),
      ),
      body: Wrap(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => AppBarWidget(),
                )
              );
            },
            child: Container(
              color: Colors.red,
              child: Text('appbar'),
              width: 50,
              height: 50,
            ),
          ),
          Container(
            color: Colors.red,
            child: Text('appbar'),
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.red,
            child: Text('appbar'),
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}



class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key key}) : super(key: key);

  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  double elevation = 0.0;
  bool leading = false;
  String title = 'AppBar';
  List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        automaticallyImplyLeading: leading, //去除默认返回按钮 
        title: Text('${title}'),
        elevation: elevation,  //阴影
        actions: actions,
      ),
      body: Column(
        children: <Widget>[
          elevationChange(),
          leadingChange(),
          titleChange(),
          actionsChange(),
        ],
      ),
    );
  }

  Widget actionsChange(){
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text('右边按纽区域'),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              PopupMenuButton(
                itemBuilder:(context ){
                  
                }
              ),
              Radio(
                value: actionChangeItemMore(),
                groupValue: 'actions',
                onChanged: (val){
                  actions = val;
                  print('${val}');
                  setState(() {
                    
                  });
                },
              ),
              Text('普通按纽'),
              SizedBox(
                width: 50,
              ),
              Radio(
                value: actionChangeItemOne(),
                groupValue: 'actions',
                onChanged: (val){
                  print('${val}');
                  actions = val;
                  setState(() {
                    
                  });
                },
              ),
              Text('二级按纽'),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> actionChangeItemOne(){
    List<Widget> data = [];
    data.add(Icon(Icons.edit),);
    return data;
  }

  List<Widget> actionChangeItemMore(){
    List<Widget> data = [];
    data.add(Icon(Icons.edit),);
    data.add(Icon(Icons.map),);
    data.add(Icon(Icons.email),);
    return data;
  }

  Widget titleChange(){
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
                  onChanged: (val){
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

  Widget leadingChange(){
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
                onChanged: (bool val){
                  leading = val;
                  print('${val}');
                  setState(() {
                    
                  });
                },
              ),
              Text('不显示'),
              SizedBox(
                width: 50,
              ),
              Radio(
                value: true,
                groupValue: leading,
                onChanged: (bool val){
                  print('${val}');
                  leading = val;
                  setState(() {
                    
                  });
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

  Widget elevationChange(){
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
          child: Text('${elevation}'),
        )
      ],
    );
  }

}