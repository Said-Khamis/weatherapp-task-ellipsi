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
             selectedItemColor: const Color.fromRGBO(255, 165, 0, 1),
             unselectedItemColor: Colors.white,
             backgroundColor: const Color.fromRGBO(34, 68, 150, 1),
             type: BottomNavigationBarType.fixed,
             currentIndex: controller.selectedIndex.value,
             onTap: controller.onItemTaped,
             items: const [
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
                     Icons.reply,
                   ),
                   label: "Back",
               )
             ],
           ) ,
           body: controller.widgetOptions.elementAt(
             controller.selectedIndex.value
           ),
       ));
    });
  }
}
