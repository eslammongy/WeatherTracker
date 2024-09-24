import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 180,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0, right: 15, left: 15),
            child: Stack(
              children: [
                // Positioned.fill(
                //   child: CustomPaint(
                //     painter: SlantedRoundedRectanglePainter(),
                //   ),
                // ),
                Positioned.fill(
                  child: SvgPicture.asset(
                    AppAssets.forecastBK,
                    fit: BoxFit.fill
                    ,
                  ),
                ),
                const Positioned(
                  right: 45,
                  top: 0,
                  child: Icon(
                    FontAwesomeIcons.cloud,
                    size: 110,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  top: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              "24°C",
                              style: AppTextStyles.styleBold52(context),
                            ),
                          ),
                          Text(
                            "H24°C L24°C",
                            style: AppTextStyles.styleRegular16(context),
                          ),
                          Text(
                            "Rain Cloudy",
                            style: AppTextStyles.styleSemiBold18(context),
                          ),
                        ],
                      ),
                      Text(
                        "Rain Cloudy",
                        style: AppTextStyles.styleSemiBold30(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Define the CustomPainter to draw the slanted rectangle with rounded corners
class SlantedRoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create the paint with gradient
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF5E17EB), Color(0xFF5700C4)], // Gradient colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Define the path for the slanted rectangle
    final Path path = Path()
      ..moveTo(0, 0) // Start at the top-left corner
      ..lineTo(
          size.width, size.height * 0.45) // Draw line to the top-right corner
      ..lineTo(size.width, size.height) // Draw line to 25% height at the right
      ..lineTo(0, size.width) // Draw line to the bottom-left corner
      ..close(); // Close the path

    // Define the rounded rectangle with a custom radius for rounded corners
    final RRect roundedRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
      topRight: const Radius.circular(20),
      topLeft: const Radius.circular(20),
    );

    // Clip the path to apply rounded corners
    canvas.clipRRect(roundedRect);

    // Draw the slanted rectangle with the gradient
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
