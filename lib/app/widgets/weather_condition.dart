import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'dart:math';

class WeatherCondition extends GetView<HomeController> {
  const WeatherCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double toCelsius = (controller.weatherData.value.main!.feelsLike)! -  273.15;

    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "Feels like",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                  ),
                  children: [
                    TextSpan(
                        text: "  ${toCelsius.round()} ",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold
                        ),
                    )
                  ],

                ),
              ),
              Container(
                width: 20,
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
                          fontSize: 17.0,
                          color: Colors.white
                      ),)

                  ],
                ),
              )
            ],
          ),
          Text(
            (controller.weatherData.value.weather![0].main)!,
          style: TextStyle(
             color: Colors.white
          ),)
       ],
    );
  }
}
