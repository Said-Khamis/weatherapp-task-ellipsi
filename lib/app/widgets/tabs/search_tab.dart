import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/app/widgets/hewa.dart';

import '../hewa_tabs.dart';

class SearchTab extends GetView<HomeController> {
   SearchTab({Key? key}) : super(key: key);

  final _formSearch = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
             title:  HewaWidgetTabs(size: 20.0,widthSize: 70, heightSize: 25,),
             elevation: 0.0,
             centerTitle: true,
          ),
           body: Container(
             width: Get.width,
             height: Get.height,
             decoration: const BoxDecoration(
                 color: Colors.blue
             ),
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Form(
                      key: _formSearch,
                       child: Column(
                         children: [
                           TextFormField(
                             controller: controller.editTextSearch,
                             autovalidateMode:
                             AutovalidateMode.onUserInteraction,
                             validator: (value) {
                               if (value == " " || value!.isEmpty) {
                                 return "Search Item is required";
                               }

                               return null;
                             },
                             decoration: InputDecoration(
                                 border: OutlineInputBorder(),
                                 contentPadding: EdgeInsets.all(10.0),
                                 hintText: "Enter your city name to search",
                                 hintStyle: TextStyle(color: Colors.white),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                   borderSide: BorderSide(
                                     color: Colors.white,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                   borderSide: BorderSide(
                                     color: Colors.white,
                                     width: 2.0,
                                   ),
                                 )
                             ),
                             style: TextStyle(
                                 color: Colors.white
                             ),
                           ),
                           MaterialButton(
                             color: Colors.amber,
                             disabledColor: Colors.grey,
                             disabledElevation: 1.0,
                             disabledTextColor: Colors.blue,
                             onPressed: () {
                               if(_formSearch.currentState!.validate()){
                                     controller.searchCity();
                               }
                             },
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: const [
                                 Icon(
                                   Icons.search,
                                   color: Colors.white,
                                 ),
                                 Text(
                                   "Search",
                                   style: TextStyle(
                                       color: Colors.white
                                   ),)
                               ],
                             ),
                           )
                         ],
                       )
                   )
                 ],
               ),
             ) ,
           ),
        )
    );;
  }
}
