import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constant.dart';

Future<List<String?>> getDeviceDetails() async {
  String? deviceName;
  String? deviceVersion;
  String? identifier;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model;
      deviceVersion = build.version.incremental;
      identifier = build.id; //UUID for Android
    } else if (Platform.isIOS) {
      IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      deviceName = data.utsname.machine;
      deviceVersion = data.systemVersion;
      identifier = data.identifierForVendor; //UUID for iOS
    }
  } on PlatformException {
    if (kDebugMode) {
      print('Failed to get platform version');
    }
  }

//if (!mounted) return;
  return [deviceName, deviceVersion, identifier];
}


Future<String> getAppVersion() async {
  String? appV;
  String? deviceVersion;
  String? identifier;
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  LocalStaticVar.appVersion = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;



  return LocalStaticVar.appVersion;

}