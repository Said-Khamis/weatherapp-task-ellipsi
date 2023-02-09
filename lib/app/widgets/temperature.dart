import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/app/common/config.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'dart:math';

class Temperature extends GetView<HomeController> {
  const Temperature({Key? key, required this.temp}) : super(key: key);

  final double? temp;

  @override
  Widget build(BuildContext context) {

    double toCelsius = (controller.weatherData.value.main!.temp)! -  273.15;

    print(toCelsius);

    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Positioned(
            top: -25.0,
            right: -20.0,
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                "${AppConfig.iconUrl}${controller.weatherData.value.weather![0].icon}@2x.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            toCelsius.round().toString(),
            style: TextStyle(
                fontSize: 80.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          Positioned(
              right: 0.0,
              bottom: 40.0,
              child: Container(
                width: 30,
                height: 30,
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        child: Text("0",
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        top: 0.0,
                        left: 0.0,
                      ),
                      Text("C",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),)
                    ]
                ),
              )
          )
        ],
      ),
    );
  }
}
