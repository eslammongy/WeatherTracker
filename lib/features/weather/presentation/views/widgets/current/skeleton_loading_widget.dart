import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/loading_state/skeleton_shape.dart';
import 'package:weather_tracker/core/widgets/skeleton_list.dart';

class SkeletonLoadingWidget extends StatelessWidget {
  const SkeletonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // show loading lotti file here
          Lottie.asset(
            AppAssets.animatedLoading,
            backgroundLoading: false,
            height: 320,
          ),
          const SizedBox(height: 15),
          // Grid for other skeleton weather data
          GridView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 2 columns
              crossAxisSpacing: 12, // Space between columns
              mainAxisSpacing: 12, // Space between rows
              mainAxisExtent: 150,
            ),
            children: const [
              SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
              SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
              SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
              SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
              SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
            ],
          ),

          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "hourly",
              style: AppTextStyles.styleSemiBold30(context),
            ),
          ),
          const SizedBox(height: 10),
          const SkeletonList()
        ],
      ),
    );
  }
}
