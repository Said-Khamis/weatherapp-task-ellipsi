import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/routes/app_pages.dart';

import '../../../common/DefaultStrings.dart';
import '../../../data/weather_data_model.dart';
import '../../home/providers/home_provider.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {

    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppPages.HOME);
      FlutterNativeSplash.remove();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
