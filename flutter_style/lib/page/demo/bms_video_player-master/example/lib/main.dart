import 'package:bms_video_player_example/fullVideo.dart';
import 'package:bms_video_player_example/test.dart';
import 'package:bms_video_player_example/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bms_video_player/bms_video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }


}


class HomePage extends StatelessWidget {
  
  BmsVideoPlayerController viewPlayerController;

  @override
  Widget build(BuildContext context) {
    BmsVideoPlayer videoPlayer = new BmsVideoPlayer(
      onCreated: onViewPlayerCreated,
      x: 0.0,
      y: 0.0,
      width: 355,
      height: 300,
    );

    // TODO: implement build
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Plugin example appasdasd'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 400,
              color: Colors.blue,
              child: videoPlayer,
            ),
            
            GestureDetector(
              onTap: (){
                this.viewPlayerController.paused();
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullVideo(videoW: videoPlayer),
                )).then((onValue){
                  this.viewPlayerController.resume();
                  this.viewPlayerController.play();
                });
              },
              child: Text('open'),
            ),
            
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
            // this.viewPlayerController.testFrame({'width':355,'height':500});
            // setState(() {
            //   width = 355;
            //   height = 500;
            // });
            
          },
        ),
      );
  }

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    // this.viewPlayerController.loadUrl("https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4");
    this.viewPlayerController.loadUrl("https://www.runoob.com/try/demo_source/movie.mp4");
  }

}
