import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weatherapp/app/widgets/hewa.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: GetBuilder(
        init: controller,
        builder: (controller) {
          return  Container(
              width: Get.mediaQuery.size.width,
              height: Get.mediaQuery.size.height,
              decoration: const BoxDecoration(
                 color: Colors.blue,
                 image: DecorationImage(
                     image: AssetImage(
                       "assets/background.png",
                     ),
                   fit: BoxFit.cover
                 )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HewaWidget(size: 35.0,widthSize: 110, heightSize: 50,)
                ],
              )
          );
        },
      ),
    ));
  }
}
