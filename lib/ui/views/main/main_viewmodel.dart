import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/services/app_localization_service.dart';
import 'package:dia_flowers_assessment/services/products_service.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends FutureViewModel<void> {
  final _productsService = locator<ProductsService>();
  final _appLocalization = locator<AppLocalizationService>();

  List<Product> get products => _productsService.products;

  @override
  Future futureToRun() async {
    await _productsService.fetchProducts(
      lang: _appLocalization.locale?.languageTag ?? 'en',
      limit: 10,
      offset: 0,
      clearAllProducts: true,
    );
  }
}
