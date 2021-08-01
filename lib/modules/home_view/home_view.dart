import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Get.size;
    ScreenUtil.init(
        BoxConstraints(
            maxHeight: screenSize.height, maxWidth: screenSize.width),
        designSize: Size(screenSize.width, screenSize.height));
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Hello Yoro',style: TextStyle(fontSize: 20.sp),),
          ),
        )
    );
  }
}
