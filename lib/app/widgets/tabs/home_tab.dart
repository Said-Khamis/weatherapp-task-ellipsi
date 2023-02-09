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

class HomeTab extends GetView<HomeController> {
   HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
     return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: HewaWidgetTabs(size: 20.0,widthSize: 70, heightSize: 25,),
              elevation: 0.0,
              centerTitle: true,
          ),
           body: Obx(() {
             return Container(
               width: Get.mediaQuery.size.width,
               height: Get.mediaQuery.size.height,
               decoration: BoxDecoration(
                   color: Colors.blue
               ),
               child: controller.isLoading.value == true
                   ? Center(
                 child: CircularProgressIndicator(
                   color: Colors.white,
                 ),
               )
                   : Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Location(locationName: controller.weatherData.value.name),
                   SizedBox(height: 35.0,),
                   Temperature(temp: controller.weatherData.value.main!.temp),
                   SizedBox(height: 15.0,),
                   WeatherCondition(),
                   SizedBox(height: 25.0,),
                   WeatherDetails()
                 ],
               ),
             );
           })
        )
    );
  }
}
