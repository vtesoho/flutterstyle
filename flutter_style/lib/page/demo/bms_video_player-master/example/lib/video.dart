import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bms_video_player/bms_video_player.dart';



class VideoWidget extends StatefulWidget {
  VideoWidget({Key key}) : super(key: key);

  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  BmsVideoPlayerController viewPlayerController;

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    double width = 355;
    double height = 200;
    BmsVideoPlayer videoPlayer = new BmsVideoPlayer(
      onCreated: onViewPlayerCreated,
      x: x,
      y: y,
      width: width,
      height: height
    );
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: videoPlayer,
      width: width,
      height: height,
    );


  }

  void onViewPlayerCreated(viewPlayerController) {
    this.viewPlayerController = viewPlayerController;
    // this.viewPlayerController.loadUrl("https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4");
    this.viewPlayerController.loadUrl("https://www.runoob.com/try/demo_source/movie.mp4");
    
  }
}