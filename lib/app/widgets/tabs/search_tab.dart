import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/app/modules/home/controllers/result_controller.dart';
import 'package:weatherapp/app/widgets/hewa.dart';

import '../hewa_tabs.dart';

class SearchTab extends GetView<ResultController> {
   SearchTab({Key? key}) : super(key: key);

  final _formSearch = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ResultController());

    return  SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
             title: HewaWidgetTabs(size: 20.0,widthSize: 70, heightSize: 25,),
             elevation: 0.0,
             centerTitle: true,
             backgroundColor: Colors.transparent,
          ),
           body: Obx(() {
              return Container(
                  width: Get.mediaQuery.size.width,
                  height: Get.mediaQuery.size.height,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/background.png",
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                  child: controller.isLoading.value == true
                      ? const Center(
                    child: CircularProgressIndicator(
                       color: Colors.white54,
                    ),
                  )
                      : Padding(
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
                                      border: const OutlineInputBorder(),
                                      contentPadding: const EdgeInsets.all(10.0),
                                      hintText: "Enter your city name to search",
                                      hintStyle: const TextStyle(color: Colors.white),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      )
                                  ),
                                  style: const TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                const SizedBox(height: 20.0,),
                                MaterialButton(
                                  color: const Color.fromRGBO(255, 165, 0, 1),
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
                  )
              );
           }),
        )
    );;
  }
}
