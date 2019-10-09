import 'package:flutter/material.dart';

class ListPageView extends StatefulWidget {
  ListPageView({Key key}) : super(key: key);

  _ListPageViewState createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController();
  List pageView = [0,1,2,3];


  @override
  void initState() { 
    super.initState();
    _scrollController.addListener((){
      print(_scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page View'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pageView.length,
        itemBuilder: _pageItem,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }


  Widget _pageItem(BuildContext context,int index){
    return ListView(
      controller: _scrollController,
      children: <Widget>[
        Container(
          height: 500,
          child: Text('${pageView[index]}'),
        ),
        Container(
          height: 500,
          child: Text('${pageView[index]}'),
        ),
        Container(
          height: 500,
          child: Text('${pageView[index]}'),
        ),
      ],
    );
  }
}