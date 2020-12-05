import 'package:device_info/device_info.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class DeviceInfo {
  final _deviceInfoPlugin = DeviceInfoPlugin();

  void getDeviceInfo() async {}

  static bool isWeb = kIsWeb;
  static bool isMobile = Platform.isIOS || Platform.isAndroid;
  static bool isDesktop = Platform.isMacOS ||
      Platform.isLinux ||
      Platform.isWindows ||
      Platform.isFuchsia;
}
