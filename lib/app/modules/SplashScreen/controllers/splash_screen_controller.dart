import 'dart:async';

import 'package:get/get.dart';
import 'package:weatherapp/app/routes/app_pages.dart';

import '../../../common/DefaultStrings.dart';
import '../../../data/weather_data_model.dart';
import '../../home/providers/home_provider.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 5), () {
         Get.offAndToNamed(AppPages.HOME);
         //Get.toNamed(AppPages.HOME);
    });

    print("onInit");
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
