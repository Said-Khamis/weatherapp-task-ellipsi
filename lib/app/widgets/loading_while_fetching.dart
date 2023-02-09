import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class LoadingData extends GetView<HomeController> {
  const LoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: Get.mediaQuery.size.width,
      height: Get.mediaQuery.size.height,
       child: const Center(
          child: CircularProgressIndicator(
             color: Colors.white,
          ),
       ),
    );
  }
}
