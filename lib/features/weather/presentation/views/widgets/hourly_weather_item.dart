import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff362A84), Color(0xff5936B4)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo
                    .withOpacity(0.2), // Shadow color with transparency
                spreadRadius: 2, // How far the shadow extends
                blurRadius: 2, // Blur effect
                offset: const Offset(1, 0), // Shadow position (x, y)
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("12:00", style: AppTextStyles.styleSemiBold20(context)),
            const SizedBox(height: 10),
            const Icon(FontAwesomeIcons.cloudRain, size: 40),
            const SizedBox(height: 10),
            Text('24°C', style: AppTextStyles.styleSemiBold24(context)),
          ],
        ),
      ),
    );
  }
}
