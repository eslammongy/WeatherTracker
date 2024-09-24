import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/weather_info_card.dart';

class WeatherDetailsWrap extends StatelessWidget {
  const WeatherDetailsWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      runSpacing: 10,
      children: [
        // Sunrise Info
        const WeatherInfoCard(
          icon: FontAwesomeIcons.solidSun,
          title: 'Sunrise',
          value: '06:00 AM',
        ),
        // Wind Speed Info
        const WeatherInfoCard(
          icon: FontAwesomeIcons.wind,
          title: 'Wind Speed',
          value: '15 km/h',
        ),
        // Sunset Info
        const WeatherInfoCard(
          icon: FontAwesomeIcons.solidMoon,
          title: 'Sunset',
          value: '06:45 PM',
        ),
        // Humidity Info
        const WeatherInfoCard(
          icon: FontAwesomeIcons.droplet,
          title: 'Humidity',
          value: '65%',
        ),
        const WeatherInfoCard(
          icon: FontAwesomeIcons.wind,
          title: 'Wind Speed',
          value: '15 km/h',
        ),
        Container(
          width: 120,
          height: 135,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff362A84), Color(0xff5936B4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.arrowRight, size: 20),
              const SizedBox(height: 10),
              Text("View More...", style: AppTextStyles.styleMedium18(context)),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
