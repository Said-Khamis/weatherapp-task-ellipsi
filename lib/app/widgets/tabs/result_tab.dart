import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'package:weatherapp/app/modules/home/controllers/result_controller.dart';

import '../hewa_tabs.dart';
import '../location.dart';
import '../temperature.dart';
import '../weather_condition.dart';
import '../weather_details.dart';

class ResultTab extends GetView<ResultController> {
  const ResultTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ResultController());
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: HewaWidgetTabs(size: 20.0,widthSize: 70, heightSize: 25,),
              elevation: 0.0,
              centerTitle: true,
              //backgroundColor:  const Color.fromRGBO(0, 92, 151, 1)
              backgroundColor: Colors.transparent,
            ),
            body: Obx(() {
              return Container(
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
                child: controller.isLoading.value == true
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                    : Stack(
                   children: [
                     Positioned(
                         top: 100.0,
                         left: 0.0,
                         right: 0.0,
                         child: Location(locationName: (controller.weatherData.value.name)!)
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Temperature(
                                icon: controller.weatherData.value != null
                                    ? (controller.weatherData.value.weather![0].icon)!
                                     : " ",
                                temp: double.tryParse(controller.weatherData.value.main!.temp.toString())),
                            WeatherCondition(
                              feelsLike: double.tryParse((controller.weatherData.value.main!.feelsLike.toString()))!,
                              condition: (controller.weatherData.value.weather![0].main)!,
                            )
                          ],
                       ),
                     ),
                     Positioned(
                         bottom: 0.0,
                         child:  WeatherDetails(
                           windSpeed: (controller.weatherData.value.wind!.speed)!,
                           humidity: (controller.weatherData.value.main!.humidity)!,
                         )
                     )
                   ],
                ),
              );
            })
        )
    );
  }
}
