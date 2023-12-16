
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lon = 0.0.obs;
  @override
  void onInit() {
    if (checkLoading().value == true) {
      getLocation();
    }
    super.onInit();
  }

  RxBool checkLoading() => _isLoading;
  RxDouble getLat() => _lat;
  RxDouble getLon() => _lon;

  getLocation() async {
    bool serviceLocation;
    LocationPermission permission;
    serviceLocation = await Geolocator.isLocationServiceEnabled();
    if (serviceLocation == false) {
      Get.defaultDialog(title: 'Location Service is Disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Container();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Container();
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      getLat().value = value.latitude;
      getLon().value = value.longitude;
      checkLoading().value = false;
      print(value.latitude);
      print(value.longitude);
    });
  }
}
