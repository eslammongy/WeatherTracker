import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/location_services.dart';

void showLocationRequestDialog(BuildContext context) {
  final appColors = context.theme.appColors;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Row(
          children: [
            Icon(Icons.location_on, color: appColors.primary, size: 30.0),
            const SizedBox(width: 10.0),
            const Text("Enable Location", style: TextStyle(fontSize: 20.0)),
          ],
        ),
        content: const Text(
          "We need your location to provide a better experience. Please enable your location service.",
          style: TextStyle(fontSize: 16.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () async {
              await LocationServices.requestLocationPermission();
              if (context.mounted) {
                Navigator.of(context).pop(); // Close dialog
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Enable"),
          ),
        ],
      );
    },
  );
}
