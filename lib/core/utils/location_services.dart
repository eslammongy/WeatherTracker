import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationServices {
  static double lat = 0.0;
  static double lon = 0.0;

  static Future<bool> checkLocationService() async =>
      await Geolocator.isLocationServiceEnabled();

  static Future<void> checkLocationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission != LocationPermission.denied) {
      _getCurrentPosition();
    } else {
      // should ask for permission
      await Geolocator.requestPermission().then((value) {
        debugPrint("Location Permission:: $value");
        if (value != LocationPermission.denied) {
          debugPrint(
              "Location Coordinates:: ${LocationServices.lat} ${LocationServices.lon}");
          _getCurrentPosition();
        }
      });
    }
  }

  static Future<void> _getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lon = position.longitude;
  }
}
