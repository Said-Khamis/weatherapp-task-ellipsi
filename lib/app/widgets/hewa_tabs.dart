import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/common/DefaultStrings.dart';
import 'package:weatherapp/app/modules/SplashScreen/controllers/splash_screen_controller.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class HewaWidgetTabs extends StatelessWidget {
   HewaWidgetTabs({Key? key, required this.size, required this.widthSize, required this.heightSize}) : super(key: key);

  final double size;
  final double widthSize;
  final double heightSize;

  @override
  Widget build(BuildContext context) {
      return Container (
        width: widthSize,
        height: heightSize,
        child: Stack(
          children: [
            Text(
              DefaultStrings.hewa,
              style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            const SizedBox(width: 10.0,),
            Positioned(
              bottom: 5.0,
              right: 0.0,
              child: Container(
                height: 10.0,
                width: 10.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 165, 0, 1),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)
                    )
                ),
              ),
            )
          ],
        )
    );
  }
}
