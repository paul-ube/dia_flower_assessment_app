import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ThemeToggleButtonModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();

  void toggleTheme(bool isDarkMode) {
    _themeService.setThemeMode(
      isDarkMode ? ThemeManagerMode.light : ThemeManagerMode.dark,
    );

    notifyListeners();
  }
}
