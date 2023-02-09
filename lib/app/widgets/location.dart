import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class Location extends GetView<HomeController> {
  const Location({Key? key, required this.locationName}) : super(key: key);

  final String? locationName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_pin,
           color: Colors.amber,
          size: 22.0,
        ),
        Text(
           controller.weatherData.value.name.toString(),
          style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20.0,
             color: Colors.white
          ),
        )
      ],
    );
  }
}
