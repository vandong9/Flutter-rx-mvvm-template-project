import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:ProjectTemplate/extensions/string_extension.dart';

enum Flavor { DEV, STAGING, PRODUCTION }
String flavorName(Flavor flavor) {
  switch (flavor) {
    case Flavor.DEV:
      return "DEV";
    case Flavor.STAGING:
      return "STAGING";
    case Flavor.PRODUCTION:
      return "PRODUCTION";
  }
  return "";
}

extension FlavorExtension on Flavor {
  String getVersionLabel() {
    switch (this) {
      case Flavor.DEV:
        return "Alpha Version: ".localized();
      case Flavor.STAGING:
        return "Beta Version: ".localized();
      case Flavor.PRODUCTION:
        return "Version: ".localized();
    }
    return "Version: ".localized();
  }
}

/// Configure
class EnvironmentConfigure {
  final String tenant = "default";
  String _appPlatform = "";
  String get appPlatform => _appPlatform;
  static String _pem;
  static String get pem => _pem;
  static String _baseURL;
  static String get baseURL => _baseURL;
  static String _visikardAPI;
  static String get visikardAPI => _visikardAPI;
  static String _vispayURL;
  static String get vispayURL => _vispayURL;

  String apiURL = "";

  EnvironmentConfigure(Flavor flavor) {
    _appPlatform = Platform.isAndroid ? "Android" : "iOS";
    switch (flavor) {
      case Flavor.DEV:
        _baseURL = "https://gateway-dev.kardsys.com";
        _visikardAPI = "https://gateway-dev.kardsys.com/visikard";
        _vispayURL = "$_baseURL/visipay/service?wsdl";
        _pem =
            "E0:18:3C:17:09:CA:B7:35:59:57:68:C6:B4:E0:85:B3:37:6F:F0:9E:92:A8:F2:BB:79:76:17:2E:AC:B4:05:C9";
        break;
      case Flavor.STAGING:
        _baseURL = "https://gateway.kardsys.com";
        _visikardAPI = "https://gateway.kardsys.com/visikard";
        _vispayURL = "$_baseURL/visipay/service?wsdl";
        _pem =
            "E0:18:3C:17:09:CA:B7:35:59:57:68:C6:B4:E0:85:B3:37:6F:F0:9E:92:A8:F2:BB:79:76:17:2E:AC:B4:05:C9";
        break;
      case Flavor.PRODUCTION:
        _baseURL = "https://gateway.kardsys.com";
        _visikardAPI = "https://gateway.kardsys.com/visikard";
        _vispayURL = "$_baseURL/visipay/service?wsdl";
        _pem =
            "E0:18:3C:17:09:CA:B7:35:59:57:68:C6:B4:E0:85:B3:37:6F:F0:9E:92:A8:F2:BB:79:76:17:2E:AC:B4:05:C9";
        break;
    }
  }
}

/// FlavorConfig
class FlavorConfig {
  final Flavor flavor;
  final String name;
  final EnvironmentConfigure configure;
  static FlavorConfig _instance;

  factory FlavorConfig({@required Flavor flavor}) {
    _instance ??= FlavorConfig._internal(
        flavor, flavorName(flavor), EnvironmentConfigure(flavor));
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.configure);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isStaging() => _instance.flavor == Flavor.STAGING;
  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
}
