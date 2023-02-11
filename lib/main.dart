import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App Ellipsi",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
