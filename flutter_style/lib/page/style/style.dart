import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_style/page/style/app_bar.dart';
import 'package:flutter_style/page/style/dropDownButtonDemo.dart';

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
          styleItem(
            (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppBarWidget(),
            ));},
            'appBar',
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DropDownButtonDEMO(),
                  ));
            },
            child: Container(
              color: Colors.red,
              child: Text('DropDownButton'),  
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

