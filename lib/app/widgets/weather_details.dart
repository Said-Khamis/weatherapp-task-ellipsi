import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class WeatherDetails extends GetView<HomeController> {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var date = DateTime.now();
    var format = DateFormat.yMMMEd();
    String dateNow =  format.format(date);

    var format1 = DateFormat("HH:mm");
    String timeNow =  format1.format(date);

    print(timeNow);

    return SizedBox(
       width: Get.mediaQuery.size.width,
       child: Padding(
         padding: EdgeInsets.all(10.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   Icon(
                     Icons.speed_outlined,
                     color: Colors.white,
                   ),
                   Text("Windspeed",
                     style: TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text("${controller.weatherData.value.wind!.speed} km/h",
                 style: TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           SizedBox(height: 10.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   Icon(
                     Icons.calendar_month_outlined,
                     color: Colors.white,
                   ),
                   Text(
                     dateNow,
                     style: TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text(
                 timeNow,
                 style: TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           SizedBox(height: 10.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   Icon(
                     Icons.temple_buddhist,
                     color: Colors.white,
                   ),
                   Text(
                     "Humidity",
                     style: TextStyle(
                         color: Colors.white
                     ),)
                 ],
               ),
               Text("${controller.weatherData.value.main!.humidity} %",
                 style: TextStyle(
                     color: Colors.white
                 ),)
             ],
           ),
           SizedBox(height: 10.0,),
         ],
       ),),
    );
  }
}
