import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/utils/animated_dialog.dart';
import 'package:weather_tracker/features/remote_weather/presentation/views/widgets/current/weather_info_card.dart';

class ViewMoreBtn extends StatelessWidget {
  const ViewMoreBtn({
    super.key,
    this.width = 120,
    this.height = 135,
    this.isForecastOpened = false,
  });
  final double width;
  final double height;
  final bool isForecastOpened;

  @override
  Widget build(BuildContext context) {
    if (isForecastOpened) {
      return SizedBox(
        width: width,
        height: height,
        child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              showAnimatedDialog(
                context,
                title: "Weather Details",
                body: _buildMoreWeatherInfoGrid(),
              );
            },
            child: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 32,
                child: Icon(FontAwesomeIcons.arrowRight, size: 20))),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff362A84), Color(0xff5936B4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          showAnimatedDialog(context,
              title: "Weather Details", body: _buildMoreWeatherInfoGrid());
        },
        child: isForecastOpened
            ? const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 32,
                child: Icon(FontAwesomeIcons.arrowRight, size: 20))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.arrowRight, size: 20),
                  const SizedBox(height: 10),
                  Text("View More...",
                      style: AppTextStyles.styleMedium18(context)),
                  const SizedBox(height: 5),
                ],
              ),
      ),
    );
  }

  Expanded _buildMoreWeatherInfoGrid() {
    return Expanded(
      child: GridView.builder(
        itemBuilder: (context, index) {
          return const WeatherInfoCard(
            icon: FontAwesomeIcons.droplet,
            title: 'Humidity',
            value: '65%',
          );
        },
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
          childAspectRatio: 1, // Aspect ratio of grid items
        ),
      ),
    );
  }
}
