import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'theme_toggle_button_model.dart';

class ThemeToggleButton extends StackedView<ThemeToggleButtonModel> {
  const ThemeToggleButton({super.key});

  @override
  Widget builder(
    BuildContext context,
    ThemeToggleButtonModel viewModel,
    Widget? child,
  ) {
    return IconButton(
      onPressed: () {
        viewModel.toggleTheme(isDarkMode(context));
      },
      icon: Icon(isDarkMode(context) ? Icons.light_mode : Icons.dark_mode),
    );
  }

  @override
  ThemeToggleButtonModel viewModelBuilder(BuildContext context) =>
      ThemeToggleButtonModel();
}
