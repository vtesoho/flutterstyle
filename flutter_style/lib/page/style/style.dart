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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: leading ? Container() : null,
        automaticallyImplyLeading: leading, //去除默认返回按钮 
        title: Text('AppBar'),
        elevation: elevation,  //阴影

      ),
      body: Column(
        children: <Widget>[
          elevationChange(),
          leadingChange(),
        ],
      ),
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