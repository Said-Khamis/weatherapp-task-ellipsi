import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/app/common/config.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'dart:math';

class Temperature extends StatelessWidget {
  const Temperature({Key? key, required this.temp, required this.icon}) : super(key: key);

  final double? temp;
  final String icon;

  @override
  Widget build(BuildContext context) {

    //var controller = Get.put(HomeController());
    //double toCelsius = (controller.weatherData.value!.main!.temp)! -  273.15;
    double toCelsius = 0.0;
    if(temp != null){
       toCelsius= (temp)! -  273.15;
    }
    print(icon);

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
                "${AppConfig.iconUrl}${icon.toString()}@2x.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            toCelsius.round().toString(),
            style: const TextStyle(
                fontSize: 80.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          Positioned(
              right: 0.0,
              bottom: 40.0,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: const [
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: Text("0",
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
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
