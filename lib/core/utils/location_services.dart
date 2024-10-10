import 'package:geolocator/geolocator.dart';

abstract class LocationServices {
  static double lat = 0.0;
  static double lon = 0.0;

  static Future<bool> checkLocationService() async =>
      await Geolocator.isLocationServiceEnabled();

  static Future<bool> checkLocationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      // should ask for permission
      locationPermission = await Geolocator.requestPermission();
      return locationPermission != LocationPermission.denied;
    } else {
      return true;
    }
  }

  static Future<void> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lon = position.longitude;
  }
}
