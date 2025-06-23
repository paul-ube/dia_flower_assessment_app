import 'package:dia_flowers_assessment/services/api.dart';
import 'package:dia_flowers_assessment/services/shared_preferences_service.dart';
import 'package:dia_flowers_assessment/ui/bottom_sheets/simple/simple_sheet.dart';
import 'package:dia_flowers_assessment/ui/dialogs/dismiss/dismiss_dialog.dart';
import 'package:dia_flowers_assessment/ui/dialogs/material_confirm/material_confirm_dialog.dart';

import 'package:dia_flowers_assessment/ui/views/start_up/start_up_view.dart';
import 'package:dia_flowers_assessment/ui/views/main/main_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dia_flowers_assessment/ui/views/product_details/product_details_view.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:dia_flowers_assessment/services/app_localization_service.dart';
import 'package:dia_flowers_assessment/ui/views/product_images/product_images_view.dart';
import 'package:dia_flowers_assessment/services/url_launcher_service.dart';
import 'package:dia_flowers_assessment/services/products_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),

    MaterialRoute(page: MainView),
    MaterialRoute(page: ProductDetailsView),
    CustomRoute(page: ProductImagesView, opaque: false),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: Api),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    InitializableSingleton(classType: SharedPreferencesService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: UrlLauncherService),
    LazySingleton(classType: ProductsService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    InitializableSingleton(classType: AppLocalizationService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: SimpleSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: DismissDialog),
    StackedDialog(classType: MaterialConfirmDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
