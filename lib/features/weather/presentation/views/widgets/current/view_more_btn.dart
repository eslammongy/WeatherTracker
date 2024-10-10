import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/utils/animated_dialog.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_info_card.dart';

class ViewMoreBtn extends StatelessWidget {
  const ViewMoreBtn({
    super.key,
    this.width = 50,
    this.height = 50,
    this.isForecastOpened = false,
  });
  final double width;
  final double height;
  final bool isForecastOpened;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: width,
        width: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: buildSizedBoxBtn(context),
        ));
  }

  Widget buildSizedBoxBtn(BuildContext context, {Function()? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        showAnimatedDialog(
          context,
          title: "Weather Details",
          body: _buildMoreWeatherInfoGrid(),
        );
      },
      child: DecoratedBox(
        decoration: isForecastOpened
            ? BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(100))
            : pubBoxDecoration,
        child: Icon(
            isForecastOpened ? FontAwesomeIcons.ellipsis : Icons.arrow_forward,
            size: 28,
            color: Colors.white),
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
        padding: const EdgeInsets.only(bottom: 20, top: 10),
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
