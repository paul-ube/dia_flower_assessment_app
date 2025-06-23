import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:dia_flowers_assessment/app/app.router.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/utils/string_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListItemModel extends BaseViewModel {
  final log = getLogger('ProductListItemModel');
  final _routerService = locator<RouterService>();
  final Product product;

  ProductListItemModel(this.product);

  String get thumbnailUrl => product.coverImage;

  String get basePrice {
    return StringUtils.formatCurrency(
      double.parse(product.basePrice),
      'AED',
    );
  }

  String? get discountedPrice {
    String? oldPriceStr = product.discountedPrice;

    if (oldPriceStr == null) {
      return null;
    }

    double? oldPrice = double.tryParse(oldPriceStr);
    double price = double.parse(product.basePrice);

    if (oldPrice == null || oldPrice <= price) {
      return null;
    }

    return StringUtils.formatCurrency(oldPrice, 'AED');
  }

  String get title => product.name;

  void navigateToDetailsView() {
    _routerService.navigateTo(ProductDetailsViewRoute(product: product));
  }
}
