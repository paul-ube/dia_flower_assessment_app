import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/services/api.dart';
import 'package:stacked/stacked.dart';

class ProductsService with ListenableServiceMixin {
  final log = getLogger('ProductsService');
  final _api = locator<Api>();

  ProductsService() {
    listenToReactiveValues([_products]);
  }

  final ReactiveValue<List<Product>> _products = ReactiveValue<List<Product>>([]);

  List<Product> get products => _products.value;

  set products(List<Product> value) {
    _products.value = value;
    notifyListeners();
  }

  Future<void> fetchProducts({
    required String lang,
    required int limit,
    required int offset,
    required bool clearAllProducts,
  }) async {
    if (clearAllProducts) {
      products = [];
    }

    products = await _api.fetchProducts(
      lang: lang,
      limit: limit,
      offset: offset,
    );

  }
}
