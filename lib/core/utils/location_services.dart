import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationServices {
  static double? lat;
  static double? lon;
  static void Function()? onDenied;
  static void Function(double lat, double lon)? callback;

  static Future<void> initLocationServices() async {
    final isEnabled = await LocationServices.checkLocationService();
    debugPrint("Location Services Is:: $isEnabled");
    if (!isEnabled) {
      LocationServices.checkLocationPermission();
    } else {
      LocationServices.checkLocationPermission();
    }
  }

  static Future<bool> checkLocationService() async =>
      await Geolocator.isLocationServiceEnabled();

  static Future<void> checkLocationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    final isDenied = locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever;
    if (!isDenied) {
      debugPrint("Location Permission Granted:: $locationPermission");
      await _getCurrentPosition();
    } else {
      // should ask for permission
      await requestLocationPermission();
    }
  }

  static Future<void> requestLocationPermission() async {
    await Geolocator.requestPermission().then((value) async {
      debugPrint("Location Permission:: $value");
      if (value != LocationPermission.denied &&
          value != LocationPermission.deniedForever) {
        await _getCurrentPosition();
      } else {
        debugPrint("Location Permission Denied:: $value");
        if (onDenied != null) onDenied!();
      }
    });
  }

  static Future<void> _getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lon = position.longitude;
    if (callback != null) callback!(lat!, lon!);
    debugPrint(
        "Location Coordinates:: ${LocationServices.lat} ${LocationServices.lon}");
  }
}
