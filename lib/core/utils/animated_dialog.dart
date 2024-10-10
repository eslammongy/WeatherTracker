import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

void showAnimatedDialog(
  BuildContext context, {
  required String title,
  required Widget body,
}) {
  final theme = context.theme;

  showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 350),
    barrierColor: Colors.black.withOpacity(0.8),
    transitionBuilder: (_, anim, __, child) => _dialogAnimation(anim, child),
    pageBuilder: (_, __, ___) {
      return PopScope(
        canPop: true,
        child: Dialog(
          backgroundColor: theme.appColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            child: Column(
              children: [
                _buildDialogTitle(theme, title, context),
                body,
              ],
            ),
          ),
        ),
      );
    },
  );
}

Row _buildDialogTitle(ThemeData theme, String title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Card(
          color: theme.appColors.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.styleSemiBold20(context),
            ),
          ),
        ),
      ),
      IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
            size: 32,
          ))
    ],
  );
}

SlideTransition _dialogAnimation(Animation<double> anim, Widget child) {
  return SlideTransition(
    position:
        Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
    child: child,
  );
}
