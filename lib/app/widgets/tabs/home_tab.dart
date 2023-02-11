import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/SplashScreen/controllers/splash_screen_controller.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'package:weatherapp/app/widgets/hewa.dart';
import 'package:weatherapp/app/widgets/location.dart';
import 'package:weatherapp/app/widgets/temperature.dart';
import 'package:weatherapp/app/widgets/weather_condition.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/app/widgets/weather_details.dart';
import '../hewa_tabs.dart';

class HomeTab extends StatelessWidget {
   HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());
     return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: HewaWidgetTabs(size: 20.0,widthSize: 70, heightSize: 25,),
              elevation: 0.0,
              centerTitle: true,
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
                           child: Location(
                               locationName: controller.weatherData.value != null
                                   ? ( controller.weatherData.value!.name)!
                                   : " "
                           )
                       ),
                       Align(
                         alignment: Alignment.center,
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Temperature(
                                 icon: controller.weatherData.value != null
                                     ?(controller.weatherData.value!.weather![0].icon)!
                                      : "No",
                                 temp: controller.weatherData.value != null
                                     ? double.tryParse(controller.weatherData.value!.main!.temp.toString())
                                     : 0.0 ),
                             WeatherCondition(
                               feelsLike: controller.weatherData.value != null
                                   ? double.tryParse((controller.weatherData.value!.main!.feelsLike.toString()))!
                                   : 0.0,
                               condition: controller.weatherData.value != null
                                   ? (controller.weatherData.value!.weather![0].main)!
                                   : "No",
                             )
                           ],
                         ),
                       ),
                       Positioned(
                       bottom: 0.0,
                       child:  WeatherDetails(
                         windSpeed: controller.weatherData.value != null
                             ? (controller.weatherData.value!.wind!.speed)!
                             : 0.0,
                         humidity: controller.weatherData.value != null
                             ? (controller.weatherData.value!.main!.humidity)!
                             : 0,
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
