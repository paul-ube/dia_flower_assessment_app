import 'package:collection/collection.dart';
import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:dia_flowers_assessment/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

class AppLocalizationService
    with ListenableServiceMixin
    implements InitializableDependency {
  final log = getLogger('AppLocalizationService');

  final _sharedPreferencesService = locator<SharedPreferencesService>();

  AppLocale? _locale;

  AppLocale? get locale => _locale;

  void setLocale(String? languageTag) {
    _locale = AppLocale.values.firstWhereOrNull(
      (locale) => locale.languageTag == languageTag,
    );

    notifyListeners();
  }

  Future<void> loadSavedLocale() async {
    String? languageTag = _sharedPreferencesService.languageTag;

    setLocale(languageTag);
  }

  Future<void> changeLocale(String? languageTag) async {
    if (languageTag != null) {
      _sharedPreferencesService.languageTag = languageTag;
    }

    setLocale(languageTag);
  }

  void initialize() {
    if (locale == null) {
      LocaleSettings.useDeviceLocale();
    } else {
      LocaleSettings.setLocaleRaw(_locale!.languageTag);
    }
  }

  @override
  Future<void> init() async {
    await loadSavedLocale();
    initialize();
  }
}
