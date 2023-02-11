import 'package:get/get.dart';

import 'package:weatherapp/app/modules/home/controllers/result_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(
      () => ResultController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
