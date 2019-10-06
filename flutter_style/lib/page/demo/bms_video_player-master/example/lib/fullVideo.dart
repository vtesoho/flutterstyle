import 'package:bms_video_player/bms_video_player.dart';
import 'package:flutter/material.dart';

class FullVideo extends StatefulWidget {
  final Widget videoW;
  FullVideo({Key key,this.videoW}) : super(key: key);

  _FullVideoState createState() => _FullVideoState();
}

class _FullVideoState extends State<FullVideo> {
  BmsVideoPlayerController viewPlayerController;
  @override
  Widget build(BuildContext context) {
    BmsVideoPlayer videoPlayer = new BmsVideoPlayer(
      onCreated: onViewPlayerCreated,
      x: 0.0,
      y: 0.0,
      width: 375,
      height: 600,
    );
    return ListView(
      children: <Widget>[
        Container(
          height: 700,
          color: Colors.red,
          child:videoPlayer,
        ),

        GestureDetector(
          onTap: (){
            // widget.viewPlayerC.muted();
            this.viewPlayerController.paused();
            Navigator.of(context).pop(true);
          },
          child: Text('clone'),
        ),
      ],
      
    );
  }

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    // this.viewPlayerController.loadUrl("https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4");
    this.viewPlayerController.resume();
    this.viewPlayerController.play();
  }
}