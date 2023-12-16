import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/domain/global_controller.dart';
import 'package:weather_app/app/ui/page/home_page/sections/body_section.dart';
import 'package:weather_app/app/ui/page/home_page/sections/header_section.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalController ctrl = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return ctrl.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: const [
                    HeaderSection(),
                    SizedBox(
                      height: 20,
                    ),
                    BodySection(),
                  ],
                );
        },
      ),
    );
  }
}
