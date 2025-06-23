import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:dia_flowers_assessment/services/app_localization_service.dart';
import 'package:stacked/stacked.dart';

class ToggleLocaleButtonModel extends BaseViewModel {
  final _appLocalizationService = locator<AppLocalizationService>();

  AppLocale? get activeLocale => _appLocalizationService.locale;

  Future<void> changeLocale(String? languageTag) async {
    setBusy(true);
    await _appLocalizationService.changeLocale(languageTag);
    setBusy(false);
    notifyListeners();
  }
}
