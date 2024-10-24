import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

var pubBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(100)),
  boxShadow: [staticBoxShadow],
  gradient: const LinearGradient(
    colors: [
      Color(0xFF5F20F1),
      Color(0xFF831D95),
      Color(0xFFAE0606),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0], // Optional, controls the distribution of colors
  ),
);

BoxDecoration customizedDecorationBox(List<Color> colors,
    {double radius = 12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    gradient: LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0], // Optional, controls the distribution of colors
    ),
  );
}

/// Throws a DioException with a connection error type. This is used to
/// simulate a network connection error when fetching remote data.
DioException noConnection() => DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionError,
    );

/// Throws a DioException with a Bad Response type. This is used to
/// simulate a bad response error when fetching remote data.
DioException badResponse(Response response) {
  final dioError = DioException(
    requestOptions: response.requestOptions,
    error: response.statusMessage,
    type: DioExceptionType.badResponse,
    response: response,
  );
  return dioError;
}

Center displayLoadingWidget(
  BuildContext context, {
  String loadingMsg = "please waiting...",
}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CircularProgressIndicator.adaptive(),
      Text(
        loadingMsg,
        textAlign: TextAlign.center,
        style: AppTextStyles.styleBold16(context),
      ),
    ],
  ));
}

/// displaying a customized snack-bar
void displayToastMsg(
  BuildContext context,
  String msg, {
  bool hasError = false,
}) {
  final theme = context.theme;
  final toast = toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    backgroundColor: theme.appColors.primary,
    alignment: Alignment.center,
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(milliseconds: 1000),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: Center(
          child: Card(
            color: theme.appColors.primary,
            margin: const EdgeInsets.only(top: 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Text(
                msg,
                style: AppTextStyles.styleMedium20(context),
              ),
            ),
          ),
        ),
      );
    },
  );

  toastification.dismiss(toast);
}

get staticBoxShadow => BoxShadow(
      color: Colors.black.withOpacity(0.2), // Shadow color with transparency
      spreadRadius: 2, // How far the shadow extends
      blurRadius: 2, // Blur effect
      offset: const Offset(1, 1), // Shadow position (x, y)
    );

String extractTime(int? time) {
  if (time == null) {
    return "";
  }
  final datetime = DateTime.fromMicrosecondsSinceEpoch(time);
  return DateFormat('h:mm a').format(datetime);
}

String extractDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return "";
  }
  return DateFormat.yMMMMEEEEd().format(dateTime);
}

DateTime validateDatetime(String strDate) {
  final dateString = strDate.replaceFirst(':', ' ');
  // Define the format pattern for the input string
  DateFormat format = DateFormat('yyyy-MM-dd HH');
  // Parse the string into a DateTime object
  DateTime parsedDate = format.parse(dateString);
  return parsedDate;
}
