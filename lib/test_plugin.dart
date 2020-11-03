import 'dart:async';

import 'package:flutter/services.dart';

class TestPlugin {
  static const MethodChannel _channel = const MethodChannel('test_plugin');

  void initCallback() {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "refresh":
          break;
    }
    });
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> calc(operA, operB) async {
    final result = await _channel.invokeMethod('calc', {
      "a": operA,
      "b": operB,
    });

    return result;
  }
}
