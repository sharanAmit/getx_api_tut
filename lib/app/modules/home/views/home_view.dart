import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_tut/app/modules/commonModule/app_color.dart';
import 'package:getx_api_tut/app/modules/commonModule/app_string.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productAPiData),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (homeController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: homeController.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              homeController.productList[index].imageLink,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              color: AppColor.purpleColor,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeController.productList[index].name,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                homeController.productList[index].brand,
                                style: TextStyle(
                                    fontSize: 14, color: AppColor.grey),
                              ),
                              Text(
                                homeController.productList[index].category,
                                style: TextStyle(
                                    fontSize: 14, color: AppColor.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: AppColor.grey200,
                      height: 2,
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
