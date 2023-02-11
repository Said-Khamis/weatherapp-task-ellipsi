import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class Location extends StatelessWidget {
  const Location({Key? key, required this.locationName}) : super(key: key);

  final String locationName;

  @override
  Widget build(BuildContext context) {

    //var controller = Get.put(HomeController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_pin,
          color: Color.fromRGBO(255, 165, 0, 1),
          size: 22.0,
        ),
        Text(
          //controller.weatherData.value.name.toString(),
          locationName,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white
          ),
        )
      ],
    );
  }
}
