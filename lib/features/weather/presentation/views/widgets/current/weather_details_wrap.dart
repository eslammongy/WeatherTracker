import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/view_more_btn.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_info_card.dart';

class WeatherDetailsWrap extends StatelessWidget {
  const WeatherDetailsWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      runSpacing: 10,
      children: [
        // Sunrise Info
        WeatherInfoCard(
          icon: FontAwesomeIcons.solidSun,
          title: 'Sunrise',
          value: '06:00 AM',
        ),
        // Wind Speed Info
        WeatherInfoCard(
          icon: FontAwesomeIcons.wind,
          title: 'Wind Speed',
          value: '15 km/h',
        ),
        // Sunset Info
        WeatherInfoCard(
          icon: FontAwesomeIcons.solidMoon,
          title: 'Sunset',
          value: '06:45 PM',
        ),
        // Humidity Info
        WeatherInfoCard(
          icon: FontAwesomeIcons.droplet,
          title: 'Humidity',
          value: '65%',
        ),
        WeatherInfoCard(
          icon: FontAwesomeIcons.wind,
          title: 'Wind Speed',
          value: '15 km/h',
        ),
        ViewMoreBtn(
          width: 130,
          height: 140,
        ),
      ],
    );
  }
}
