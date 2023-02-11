import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

import '../../../data/weather_data_model.dart';
import '../providers/home_provider.dart';

class ResultController extends GetxController {

  var weatherData = WeatherData().obs;
  var isLoading = false.obs;
  final editTextSearch = TextEditingController();

  searchCity(){

    isLoading.value = true;

    String citName = editTextSearch.text.trim().toString();
    HomeProvider().searchWeatherByCityName(citName)
        .then((value) {
      if(value != null){
        weatherData.value = WeatherData.fromJson(value);
      }
      isLoading.value = false;
      Get.find<HomeController>().manuallySetIndex(2);

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
