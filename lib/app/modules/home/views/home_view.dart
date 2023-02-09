import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    return  Obx(() {
       return SafeArea(
           child: Scaffold(
           bottomNavigationBar: BottomNavigationBar(
             showSelectedLabels: false,
             showUnselectedLabels: false,
             selectedItemColor: Colors.amber,
             unselectedItemColor: Colors.white,
             backgroundColor: Colors.blue,
             type: BottomNavigationBarType.fixed,
             currentIndex: controller.selectedIndex.value,
             onTap: controller.onItemTaped,
             items: [
               BottomNavigationBarItem(
                   icon: Icon(
                     Icons.home_filled,
                   ),
                   label: "Home"
               ),
               BottomNavigationBarItem(
                   icon: Icon(
                     Icons.search,
                   ),
                   label: "Search"
               ),
               BottomNavigationBarItem(
                   icon: Icon(
                     Icons.arrow_back_ios,
                   ),
                   label: "Back",
               )
             ],
           ) ,
           body:  Center(
             child: controller.widgetOptions.elementAt(controller.selectedIndex.value),
           ),
       ));
    });
  }
}
