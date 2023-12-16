import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/domain/global_controller.dart';
import 'package:weather_app/app/ui/widgets/big_text.dart';

import '../../../widgets/small_text.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  String city = '';

  String dateTime = '${DateFormat.yMMMd().format(DateTime.now())}';
  final GlobalController ctrl = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: city,
            size: 35,
            weight: FontWeight.w400,
          ),
          SmallText(
            text: dateTime,
            color: Colors.grey[700]!,
            size: 14,
            weight: FontWeight.w400,
            height: 1.5,
          )
        ],
      ),
    );
  }

  getAddress() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          ctrl.getLat().value, ctrl.getLon().value);
      print(placemarks);
      Placemark place = placemarks[1];
      setState(() {
        city = place.locality!;
      });
    } catch (e) {
      print('error here: $e');
    }
  }
}
