import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/app/data/global/api_call.dart';
import 'package:weather_app/app/ui/page/home_page/home_page.dart';

void main() {
  ApiCall.initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
