import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'dart:math';

class WeatherCondition extends StatelessWidget {
   const WeatherCondition({Key? key, required this.feelsLike, required this.condition}) : super(key: key);

  final double feelsLike;
  final String condition;

  @override
  Widget build(BuildContext context) {
    //var controller = Get.put(HomeController());
    //double toCelsius = (controller.weatherData.value.main!.feelsLike)! -  273.15;
    double toCelsius = (feelsLike) -  273.15;

    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "Feels like",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                  ),
                  children: [
                    TextSpan(
                        text: "  ${toCelsius.round()} ",
                        style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold
                        ),
                    )
                  ],

                ),
              ),
              SizedBox(
                width: 20,
                height: 30,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: const [
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
            //(controller.weatherData.value.weather![0].main)!,
          condition,
          style: const TextStyle(
             color: Colors.white
          ),)
       ],
    );
  }
}
