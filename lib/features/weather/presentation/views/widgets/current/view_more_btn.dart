import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/utils/animated_dialog.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_info_card.dart';

class ViewMoreBtn extends StatelessWidget {
  const ViewMoreBtn({
    super.key,
    this.width = 50,
    this.height = 50,
    this.isForecastOpened = false,
    required this.weatherData,
  });
  final double width;
  final double height;
  final bool isForecastOpened;
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: width,
        width: height,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              showAnimatedDialog(
                context,
                title: "Weather Details",
                body: _buildMoreWeatherInfoGrid(weatherData),
              );
            },
            child: DecoratedBox(
              decoration: isForecastOpened
                  ? BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100))
                  : pubBoxDecoration,
              child: Icon(
                  isForecastOpened
                      ? FontAwesomeIcons.ellipsis
                      : Icons.arrow_forward,
                  size: 28,
                  color: Colors.white),
            ),
          ),
        ));
  }

  Expanded _buildMoreWeatherInfoGrid(WeatherData weatherData) {
    return Expanded(
        child: GridView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 20, top: 10),
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
