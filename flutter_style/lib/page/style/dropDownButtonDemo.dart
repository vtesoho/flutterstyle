import 'package:flutter/material.dart';

class DropDownButtonDEMO extends StatefulWidget {
  DropDownButtonDEMO({Key key}) : super(key: key);

  _DropDownButtonDEMOState createState() => _DropDownButtonDEMOState();
}

class _DropDownButtonDEMOState extends State<DropDownButtonDEMO> {
  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownButton'),
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: new DropdownButton(
              items: getListData(),
              hint: Text('下拉选择你想要的数据'),//当没有默认值的时候可以设置的提示
              value: value,//下拉菜单选择完之后显示给用户的值
              onChanged: (T){//下拉菜单item点击之后的回调
                setState(() {
                  value=T;
                });
              },
              underline:Container(),
              elevation: 2,//设置阴影的高度
              style: new TextStyle(//设置文本框里面文字的样式
                color: Colors.red
              ),
            //  isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
              iconSize: 0,//设置三角标icon的大小

              
            ),
          ),
        ],
      ),
    );
  }


  List<DropdownMenuItem> getListData(){
    List<DropdownMenuItem> items=new List();
    DropdownMenuItem dropdownMenuItem1=new DropdownMenuItem(
      child:new Text('1'),
      value: '1',
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2=new DropdownMenuItem(
      child:new Text('2'),
      value: '2',
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3=new DropdownMenuItem(
      child:new Text('3'),
      value: '3',
    );
    items.add(dropdownMenuItem3);
    // DropdownMenuItem dropdownMenuItem4=new DropdownMenuItem(
    //   child:new Text('4'),
    //   value: '4',
    // );
    // items.add(dropdownMenuItem4);
    // DropdownMenuItem dropdownMenuItem5=new DropdownMenuItem(
    //   child:new Text('5'),
    //   value: '5',
    // );
    // items.add(dropdownMenuItem5);
    // DropdownMenuItem dropdownMenuItem6=new DropdownMenuItem(
    //   child:new Text('6'),
    //   value: '6',
    // );
    // items.add(dropdownMenuItem6);
    // DropdownMenuItem dropdownMenuItem7=new DropdownMenuItem(
    //   child:new Text('7'),
    //   value: '7',
    // );
    // items.add(dropdownMenuItem7);
    // DropdownMenuItem dropdownMenuItem8=new DropdownMenuItem(
    //   child:new Text('8'),
    //   value: '8',
    // );
    // items.add(dropdownMenuItem8);
    // DropdownMenuItem dropdownMenuItem9=new DropdownMenuItem(
    //   child:new Text('9'),
    //   value: '9',
    // );
    // items.add(dropdownMenuItem9);
    // DropdownMenuItem dropdownMenuItem10=new DropdownMenuItem(
    //   child:new Text('10'),
    //   value: '10',
    // );
    // items.add(dropdownMenuItem10);
    return items;
  }
}