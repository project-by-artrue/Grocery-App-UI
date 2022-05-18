import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/globals.dart' as globals;

class DeviceHellper {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future<void> initPlatformState() async {
    try {
      if (Platform.isAndroid) {
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      <String, dynamic>{'Error:': 'Failed to get platform version.'};
      print("////////////////////////////error");
    }
  }

  _readAndroidBuildData(AndroidDeviceInfo build) {
    print("////////////////////////////${build.product}");

    globals.imeiNo = build.device!;
    globals.hardware = build.hardware!;
    globals.manufacturer = build.manufacturer!;
    globals.modelName = build.model!;
    globals.deviceName = build.device!;
    print('ffffffffffffffffffffff${build.id}---------${build.model}');
  }

  _readIosDeviceInfo(IosDeviceInfo data) {
    globals.manufacturer = data.name!;

    globals.hardware = data.systemVersion!;
    globals.modelName = data.model!;
    globals.deviceName = data.localizedModel!;

    globals.imeiNo = data.utsname.nodename!;
  }
}
