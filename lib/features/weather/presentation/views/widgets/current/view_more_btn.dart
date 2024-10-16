import 'package:flutter/material.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/utils/animated_dialog.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_info_card.dart';

class ViewMoreBtn extends StatelessWidget {
  const ViewMoreBtn({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1),
      onTap: () {
        showAnimatedDialog(
          context,
          title: "Weather Details",
          body: _buildMoreWeatherInfoGrid(weatherData),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
        child: DecoratedBox(
          decoration: pubBoxDecoration.copyWith(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Transform.scale(
              scale: 1.4,
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildMoreWeatherInfoGrid(WeatherData weatherData) {
    return Expanded(
        child: GridView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(bottom: 20, top: 10, left: 8, right: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 10, // Space between columns
              mainAxisSpacing: 10, // Space between rows
              childAspectRatio: 1, // Aspect ratio of grid items
            ),
            children: [
          // Sunrise Info
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.lowTempIcon,
            title: 'Min Temp',
            value: "${weatherData.minTemp}",
          ),
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.highTempIcon,
            title: 'Max Temp',
            value: "${weatherData.maxTemp}",
          ),
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.sunriseIcon,
            title: 'Sunrise',
            value: extractTime(weatherData.sunriseTs),
          ),
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.sunsetIcon,
            title: 'Sunset',
            value: extractTime(weatherData.sunsetTs),
          ),
          // Wind Speed Info
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.windSpeed,
            title: 'Wind Speed',
            value: '${weatherData.windSpd} km/h',
          ),
          // Humidity Info
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.humidity,
            title: 'Humidity',
            value: '${weatherData.humidity} %',
          ),
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.cloudIcon,
            title: 'Clouds',
            value: '${weatherData.clouds} km/h',
          ),
          WeatherInfoCard(
            width: 150,
            iconPath: AppAssets.snowIcon,
            title: 'Snow',
            value: '${weatherData.snow} ',
          ),
        ]));
  }
}
