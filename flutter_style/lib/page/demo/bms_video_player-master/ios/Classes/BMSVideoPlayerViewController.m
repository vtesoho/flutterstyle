#import "BMSVideoPlayerViewController.h"
#import <JPVideoPlayer/JPVideoPlayerKit.h>

@interface BMSVideoPlayerViewController ()<JPVideoPlayerDelegate>

@end

@implementation BMSVideoPlayerViewController {
    UIView * _videoView;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}

#pragma mark - life cycle

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  if ([super init]) {
    _viewId = viewId;
    _videoView = [UIView new];
//    _videoView.backgroundColor = [UIColor greenColor];
    NSDictionary *dic = args;
    CGFloat x = [dic[@"x"] floatValue];
    CGFloat y = [dic[@"y"] floatValue];
    CGFloat width = [dic[@"width"] floatValue];
    CGFloat height = [dic[@"height"] floatValue];
      NSLog(@"initWithWithFrame width: %f",width);
      NSLog(@"initWithWithFrame height: %f",height);
    _videoView.frame = CGRectMake(x, y, width, height);
      _videoView.clipsToBounds = YES;
    _videoView.jp_videoPlayerDelegate = self;
    NSString* channelName = [NSString stringWithFormat:@"bms_video_player_%lld", viewId];
    _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
    __weak __typeof__(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      [weakSelf onMethodCall:call result:result];
    }];

  }
  return self;
}

- (nonnull UIView *)view {
    return _videoView;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"onMethodCall");
  if ([[call method] isEqualToString:@"loadUrl"]) {
    [self onLoadUrl:call result:result];
  } else if ([[call method] isEqualToString:@"test"]) {
//      NSString* url = [call arguments];
      NSDictionary *url = [call arguments];
      NSLog(@"url %@",url[@"height"]);
//      int widtha = [url objectForKey:@"width"];
//      NSInteger heighta = ;
    [self test:[url[@"width"] intValue] height:[url[@"height"] intValue]];
  } else if ([[call method] isEqualToString:@"muted"]) {
      if(_videoView.jp_muted == 0){
          _videoView.jp_muted = true;
      }else{
          _videoView.jp_muted = false;
      }
      result(@YES);
  }  else if ([[call method] isEqualToString:@"paused"]) {
      [_videoView jp_pause];
      result(@YES);
   }else if ([[call method] isEqualToString:@"resume"]) {
      NSString *url = @"https://www.runoob.com/try/demo_source/movie.mp4";
      NSURL* nsUrl = [NSURL URLWithString:url];
      [_videoView jp_resumePlayWithURL:nsUrl options:kNilOptions configuration:nil];
//      result(@YES);
   }  else if ([[call method] isEqualToString:@"play"]) {
       [_videoView jp_resume];
       result(@YES);
    }  else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)onLoadUrl:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSString* url = [call arguments];
  if (![self loadUrl:url]) {
    result([FlutterError errorWithCode:@"loadUrl_failed"
                               message:@"Failed parsing the URL"
                               details:[NSString stringWithFormat:@"URL was: '%@'", url]]);
  } else {
    result(nil);
  }
}

-(bool)test:(int)width height:(int)height {
//    _videoView.frame = CGRectMake(0, 0, width, height);
    [_videoView jp_test];
    NSString *url = @"https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4";
    NSURL* nsUrl = [NSURL URLWithString:url];
    [_videoView jp_resumePlayWithURL:nsUrl options:kNilOptions configuration:nil];
    
//    _videoView.jp_videoPlayerDelegate = self;
//    _videoView.clipsToBounds = YES;
//    _videoView.jp_videoPlayerView.frame =CGRectMake(0, 0, 375, 400);
//    [_videoView jp_pause];
//    [_videoView setFrame:CGRectMake(0, 0, 375, 400)];
//    [_videoView setBounds:CGRectMake(-30, -335, 375, 670)];
//    [_videoView setCenter:CGPointMake(0, 0)];
//    NSLog(@"cuttent time %lld",_videoView.jp_currentTime.value);
//    CMTime test = _videoView.jp_currentTime;
//    NSString *url = @"https://www.runoob.com/try/demo_source/movie.mp4";
//    NSURL* nsUrl = [NSURL URLWithString:url];
//    [_videoView jp_playVideoMuteWithURL:nsUrl bufferingIndicator:nil progressView:nil configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {}];
//    [_videoView jp_resumePlayWithURL:nsUrl options:nil configuration:nil];
    
    

//    _videoView.jp_controlView.frame.size.width = ;
//    _videoView.jp_controlView.frame=CGRectMake(20, 20, width, height);
//    [_videoView layoutT]
//    NSString *url = @"https://vd3.bdstatic.com/mda-jbcku58bvs34kjav/mda-jbcku58bvs34kjav.mp4";
//    NSURL* nsUrl = [NSURL URLWithString:url];
//    [_videoView set];
//    [_videoView jp_test];
//    [_videoView jp_playVideoMuteWithURL:nsUrl bufferingIndicator:nil progressView:nil configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {
//
//    }];
    
//    [_videoView jp_gotoPortrait];
//    [_videoView setFrame:CGRectMake(20, 20, width, height)];
//    [_videoView setBounds:CGRectMake(20, 20, width, height)];
//    _videoView.setfr
//    [_videoView setBounds:CGRectMake(20, 20, width, height)];
//    [_videoView setFrameText:CGRectMake(20, 20, width, height)];
//    [_videoView setCenter:CGPointMake(200, 200)];
    //设置整体的uiview
    
//    [_videoView systemLayoutSizeFittingSize:CGSizeMake(300, 500)];
//    [_videoView updateConstraints];
    
    return true;
}

- (bool)loadUrl:(NSString*)url {
  NSURL* nsUrl = [NSURL URLWithString:url];
  if (!nsUrl) {
    return false;
  }
    

    NSLog(@"width :%f  height: %f",_videoView.frame.size.width,_videoView.frame.size.height);
  [_videoView jp_playVideoWithURL:nsUrl
                           bufferingIndicator:nil
                                  controlView:nil
                                 progressView:nil
                                configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {
//                                     self.muteSwitch.on = ![self.videoContainer jp_muted];
                                }];
    
    
//    [_videoView jp_playVideoMuteWithURL:nsUrl bufferingIndicator:nil progressView:nil configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {
//
//                                    }];
    
    NSLog(@"width :%f  height: %f",_videoView.frame.size.width,_videoView.frame.size.height);
    

  return true;
}

#pragma mark - JPVideoPlayerDelegate

- (BOOL)shouldAutoReplayForURL:(nonnull NSURL *)videoURL {
    return true;
}
@end
