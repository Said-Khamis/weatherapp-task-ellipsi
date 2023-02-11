import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/common/DefaultStrings.dart';
import 'package:weatherapp/app/data/weather_data_model.dart';
import 'package:weatherapp/app/modules/home/providers/home_provider.dart';
import 'package:weatherapp/app/widgets/tabs/home_tab.dart';
import 'package:weatherapp/app/widgets/tabs/result_tab.dart';
import 'package:weatherapp/app/widgets/tabs/search_tab.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {

  var selectedIndex = 0.obs;
  var isManuallyTapped = false.obs;
  var weatherData = Rxn<WeatherData>();
  var isLoading = false.obs;

  List<Widget> widgetOptions = <Widget>[
      HomeTab(),
      SearchTab(),
      const ResultTab()
  ];

  void onItemTaped(int index){

    if(!isManuallyTapped.value){
      if(index != 2){
        selectedIndex.value = index;
      }
    }else{
      isManuallyTapped.value = false;
    }

  }

  void manuallySetIndex(int index) {
     selectedIndex.value = index;
     isManuallyTapped.value = true;
  }

  final editTextSearch = TextEditingController();


  getDarWeather(){

    isLoading.value = true;

    HomeProvider().searchWeatherByCityName(DefaultStrings.city)
        .then((value) {
      if(value != null){
        weatherData.value = WeatherData.fromJson(value);
      }
      isLoading.value = false;

    }, onError: (error){

      Get.snackbar("Message", error.toString());

      isLoading.value = false;

    }).whenComplete(() {

      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDarWeather();
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
