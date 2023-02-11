import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class WeatherDetails extends StatelessWidget {
   const WeatherDetails({Key? key, required this.windSpeed, required this.humidity}) : super(key: key);

  final double windSpeed;
  final int humidity;

  @override
  Widget build(BuildContext context) {

    //var controller = Get.put(HomeController());

    var date = DateTime.now();
    var format = DateFormat.yMMMEd();
    String dateNow =  format.format(date);

    var format1 = DateFormat("HH:mm");
    String timeNow =  format1.format(date);

    print(timeNow);

    return SizedBox(
       width: Get.mediaQuery.size.width,
       child: Padding(
         padding: const EdgeInsets.all(10.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: const [
                   Icon(
                     Icons.speed_outlined,
                     color: Colors.white,
                   ),
                   SizedBox(width: 5.0,),
                   Text("Windspeed",
                     style: TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text(
                 //"${controller.weatherData.value.wind!.speed} km/h",
                 "$windSpeed km/h",
                 style: const TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           const SizedBox(height: 10.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   const Icon(
                     Icons.calendar_month_outlined,
                     color: Colors.white,
                   ),
                   const SizedBox(width: 5.0,),
                   Text(
                     dateNow,
                     style: const TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text(
                 timeNow,
                 style: const TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           const SizedBox(height: 10.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: const [
                   Icon(
                     Icons.cloud,
                     color: Colors.white,
                   ),
                   SizedBox(width: 5.0,),
                   Text(
                     "Humidity",
                     style: TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text(
                 //"${controller.weatherData.value.main!.humidity} %",
                 "$humidity %",
                 style: const TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           const SizedBox(height: 10.0,),
         ],
       ),),
    );
  }
}
