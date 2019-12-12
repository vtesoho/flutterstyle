import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brightness_tools/brightness_tools.dart';

void main() {
  const MethodChannel channel = MethodChannel('brightness_tools');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BrightnessTools.platformVersion, '42');
  });
}
