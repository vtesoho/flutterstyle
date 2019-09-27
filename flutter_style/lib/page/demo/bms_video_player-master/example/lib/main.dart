import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bms_video_player/bms_video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  BmsVideoPlayerController viewPlayerController;
  double width = 355;
  double height = 200;
  @override
  void initState() {
    super.initState();
  }
  double marginLeft = 10;
  double marginRight = 10;

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    
//    var height = 500;
    BmsVideoPlayer videoPlayer = new BmsVideoPlayer(
      onCreated: onViewPlayerCreated,
      x: x,
      y: y,
      width: width,
      height: height
    );
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example appasdasd'),
        // ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: marginLeft,right:marginRight),
              alignment: Alignment.center,
              color: Colors.red,
              child: videoPlayer,
              width: width,
              height: height,
            ),
            Wrap(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    this.viewPlayerController.muted();
                  },
                  child: Container(
                    color: Colors.orange,
                    child: Text('静音'),
                    margin: EdgeInsets.all(10),
                  )
                ),
                GestureDetector(
                  onTap: (){
                    this.viewPlayerController.paused();
                  },
                  child: Container(
                    color: Colors.orange,
                    child: Text('暂停'),
                    margin: EdgeInsets.all(10),
                  )
                ),
                GestureDetector(
                  onTap: (){
                    this.viewPlayerController.play();
                  },
                  child: Container(
                    color: Colors.orange,
                    child: Text('播放'),
                    margin: EdgeInsets.all(10),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    this.viewPlayerController.testFrame({'width':355,'height':200});
                    setState(() {
                      width = 355;
                      height = 200;
                      marginLeft = 10;
                      marginRight = 10;
                    });
                  },
                  child: Container(
                    color: Colors.orange,
                    child: Text('355*200'),
                    margin: EdgeInsets.all(10),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    this.viewPlayerController.testFrame({'width':375,'height':500});
                    setState(() {
                      width = 375;
                      height = 500;
                      marginLeft = 0;
                      marginRight = 0;
                    });
                  },
                  child: Container(
                    color: Colors.orange,
                    child: Text('375*500'),
                    margin: EdgeInsets.all(10),
                  ),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            this.viewPlayerController.testFrame({'width':355,'height':500});
            setState(() {
              width = 355;
              height = 500;
            });
            // print(this.viewPlayerController);
            
          },
        ),
      ),
    );
  }

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    this.viewPlayerController.loadUrl("https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4");
    // this.viewPlayerController.loadUrl("https://www.runoob.com/try/demo_source/movie.mp4");
    
  }


}
