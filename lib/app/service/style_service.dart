import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleService extends GetxService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  RxDouble fontSize = RxDouble(24);
  RxString fontFamily = RxString('');
  RxString fontColor = RxString('');

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  void setData() async {
    await remoteConfig.fetchAndActivate();
    fontSize.value = remoteConfig.getDouble('font_size');

    String remoteConfFontColor = remoteConfig.getString('font_color');

    fontColor.value = remoteConfFontColor.startsWith('#')
        ? remoteConfFontColor
        : '#${remoteConfFontColor}';

    debugPrint('values: ${fontSize.value}\n${fontColor.value}');
  }
}
