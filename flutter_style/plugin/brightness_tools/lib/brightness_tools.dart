import 'dart:async';

import 'package:flutter/services.dart';

class BrightnessTools {
  static const MethodChannel _channel =
      const MethodChannel('brightness_tools');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 正常情况返回true|false，如果android出错误会返回字符串error，以区分
  ///  判断是否开启了自动亮度调节
  static Future get isAutoBrightness async {
    final isAutoBrightness = await _channel.invokeMethod('isAutoBrightness');
    return isAutoBrightness;
  }

  /// 正常情况返回true|false，如果android出错误会返回字符串error，以区分
  /// 获取屏幕的亮度
  static Future get getScreenBrightness async {
    final screenBrightness = await _channel.invokeMethod('getScreenBrightness');
    return screenBrightness;
  }
  
  /// 正常情况返回true，如果android出错误会返回字符串error，以区分
  /// 设置亮度
  static Future get setBrightness async {
    final setBrightness = await _channel.invokeMethod('setBrightness');
    return setBrightness;
  }
}
