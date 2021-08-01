import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoro_task/modules/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yoro Task',
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
