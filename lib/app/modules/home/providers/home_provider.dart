import 'dart:io';

import 'package:get/get.dart';
import 'package:weatherapp/app/common/config.dart';

import '../../../common/api_exceptions.dart';

class HomeProvider extends GetConnect {

  Future<dynamic> searchWeatherByCityName(String citName) async{
    var responseJson;
    try{
      var response = await get("${AppConfig.baseUrl}/weather?q=$citName&appid=${AppConfig.apiKey}");
      //print(response.body);
      responseJson = _returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  void onInit() {
    super.onInit();
  }

  dynamic _returnResponse(Response? response) {
    switch (response?.statusCode) {
      case 200:
        return response!.body;

      case 400:
        throw BadRequestException(response);
      case 401:
      case 403:
        throw UnauthorisedException(response);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response?.statusCode}');
    }
  }

}
