import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/services/api.dart';
import 'package:dia_flowers_assessment/services/shared_preferences_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dia_flowers_assessment/services/app_localization_service.dart';
import 'package:dia_flowers_assessment/services/url_launcher_service.dart';
import 'package:dia_flowers_assessment/services/products_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<Api>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<SharedPreferencesService>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<AppLocalizationService>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<UrlLauncherService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ProductsService>(onMissingStub: OnMissingStub.returnDefault),
    // @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterApi();
  getAndRegisterRouterService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSharedPreferencesService();
  getAndRegisterAppLocalizationService();
  getAndRegisterUrlLauncherService();
  getAndRegisterProductsService();
  // @stacked-mock-register
}

MockApi getAndRegisterApi() {
  _removeRegistrationIfExists<Api>();
  final service = MockApi();
  locator.registerSingleton<Api>(service);
  return service;
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockSharedPreferencesService getAndRegisterSharedPreferencesService() {
  _removeRegistrationIfExists<SharedPreferencesService>();
  final service = MockSharedPreferencesService();
  locator.registerSingleton<SharedPreferencesService>(service);
  return service;
}

MockAppLocalizationService getAndRegisterAppLocalizationService() {
  _removeRegistrationIfExists<AppLocalizationService>();
  final service = MockAppLocalizationService();
  locator.registerSingleton<AppLocalizationService>(service);
  return service;
}

MockUrlLauncherService getAndRegisterUrlLauncherService() {
  _removeRegistrationIfExists<UrlLauncherService>();
  final service = MockUrlLauncherService();
  locator.registerSingleton<UrlLauncherService>(service);
  return service;
}

MockProductsService getAndRegisterProductsService() {
  _removeRegistrationIfExists<ProductsService>();
  final service = MockProductsService();
  locator.registerSingleton<ProductsService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
