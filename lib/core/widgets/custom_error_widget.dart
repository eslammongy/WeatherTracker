import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/error/api_failure.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.failure, this.onPressed});
  final Failure failure;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 160,
          ),
          Center(
            child: Image.asset(
              failure.exceptionType == DioExceptionType.connectionError
                  ? AppAssets.noConnectionErrorImg
                  : AppAssets.responseErrorImg,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${failure.message}",
            textAlign: TextAlign.center,
            style: AppTextStyles.styleSemiBold24(context),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                "Try again",
                textAlign: TextAlign.center,
                style: AppTextStyles.styleMedium20(context)
                    .copyWith(color: Colors.redAccent),
              )),
        ],
      ),
    );
  }
}
