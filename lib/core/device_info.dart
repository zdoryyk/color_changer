import 'dart:ui';

import 'package:flutter/foundation.dart';

class DeviceInfo {
  bool medium = false;
  bool big = false;
  bool small = false;
  double height;
  double width;
  DeviceInfo({required this.height, required this.width}) {
    _setDeviceSize();
  }

  void _setDeviceSize() {
    if (height >= 840) {
      big = true;
    } else if (height > 780) {
      medium = true;
    } else {
      small = true;
    }
  }

  @override
  String toString() {
    return 'DeviceSize(medium: $medium, big: $big, small: $small, height: $height, width: $width)';
  }
}

extension ThemePlatformExtension on DeviceInfo {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isCupertino => [
    TargetPlatform.iOS,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
  Color get cupertinoAlertColor => const Color(0xFFF82B10);
  Color get cupertinoActionColor => const Color(0xFF3478F7);
}
