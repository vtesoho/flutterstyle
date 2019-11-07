import 'dart:async';

import 'package:flutter/services.dart';

class TwoCode {
  static const MethodChannel _channel =
      const MethodChannel('two_code');

  static Future<String> get scan async {
    final String version = await _channel.invokeMethod('scan');
    return version;
  }
}
