import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/widgets/custom_text_input_filed.dart';

class SearchForCityScreen extends StatelessWidget {
  const SearchForCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final theme = context.theme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextInputField(
            textEditingController: searchController,
            height: 55,
            hint: "search for city by name...",
            bkColor: theme.appColors.surface,
            focusColor: theme.appColors.primary,
            prefix: const Icon(FontAwesomeIcons.magnifyingGlass),
          )
        ],
      ),
    );
  }
}
