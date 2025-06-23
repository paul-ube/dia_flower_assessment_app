// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:stacked_themes/src/theme_service.dart';

import '../services/api.dart';
import '../services/app_localization_service.dart';
import '../services/products_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/url_launcher_service.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  locator.registerSingleton(sharedPreferencesService);

  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => UrlLauncherService());
  locator.registerLazySingleton(() => ProductsService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  final appLocalizationService = AppLocalizationService();
  await appLocalizationService.init();
  locator.registerSingleton(appLocalizationService);

  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
