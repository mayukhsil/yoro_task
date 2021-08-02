import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoro_task/modules/home_view/home_view_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = Get.size;
    ScreenUtil.init(
        BoxConstraints(
            maxHeight: screenSize.height, maxWidth: screenSize.width),
        designSize: Size(screenSize.width, screenSize.height));
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Hello Yoro',
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.random1.value =
                    await controller.generateRandomNumbers();
                controller.random2.value =
                    await controller.generateRandomNumbers();
                controller.random3.value =
                    await controller.generateRandomNumbers();
                final random = Random();
                controller.width.value = random.nextInt(200).toDouble();
                await controller.onInit();
              },
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                                padding:
                                    EdgeInsets.only(top: 15.sp, left: 80.w),
                                child: Container(
                                    height: 60.h,
                                    width: controller.width.value,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                                Colors.grey, BlendMode.exclusion),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15.sp),
                                              child: Image.network(
                                                controller
                                                    .messageModel
                                                    .data[controller.random1.value]
                                                    .image,
                                                fit: BoxFit.cover,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Center(
                                                child: Text(
                                                  '${controller.messageModel.data[controller.random1.value].message}',
                                                  style: TextStyle(
                                                      fontSize: 22.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ],
                                      ),
                                    )));
                          } else if (index == 1) {
                            return Padding(
                                padding:
                                    EdgeInsets.only(top: 15.sp, right: 80.w),
                                child: Container(
                                    height: 60.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                                Colors.grey, BlendMode.exclusion),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15.sp),
                                              child: Image.network(
                                                controller
                                                    .messageModel
                                                    .data[controller.random2.value]
                                                    .image,
                                                fit: BoxFit.cover,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${controller.messageModel.data[controller.random2.value].message}',
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              )),
                                        ],
                                      ),
                                    )));
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(top: 15.sp, left: 80.w),
                              child: Container(
                                height: 60.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.grey, BlendMode.exclusion),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.sp),
                                          child: Image.network(
                                            controller
                                                .messageModel
                                                .data[controller.random3.value]
                                                .image,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (BuildContext context,
                                                Widget child,
                                                ImageChunkEvent loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Text(
                                              '${controller.messageModel.data[controller.random3.value].message}',
                                              style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
              ),
            ),
          ),
        );
      },
    );
  }
}
