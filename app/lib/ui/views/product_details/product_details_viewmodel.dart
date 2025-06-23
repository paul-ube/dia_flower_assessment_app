import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:dia_flowers_assessment/app/app.locator.dart';
import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:dia_flowers_assessment/app/app.router.dart';
import 'package:dia_flowers_assessment/enums/ui.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/model/product_details/product_details.dart';
import 'package:dia_flowers_assessment/model/product_variation/product_variation.dart';
import 'package:dia_flowers_assessment/services/api.dart';
import 'package:dia_flowers_assessment/services/app_localization_service.dart';
import 'package:dia_flowers_assessment/utils/string_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:collection/collection.dart';

class ProductDetailsViewModel extends FutureViewModel<ProductDetails> {
  final log = getLogger('ProductDetailsViewModel');
  final _api = locator<Api>();
  final _routerService = locator<RouterService>();
  final _appLocalizationService = locator<AppLocalizationService>();
  final Product product;

  carousel.CarouselSliderController carouselController =
      carousel.CarouselSliderController();

  ProductDetailsViewModel(this.product);

  List<String> _imageList = [];

  List<String> get imageList {
    if (selectedVariation != null) {
      return selectedVariation!.images;
    }

    return _imageList;
  }

  set imageList(List<String> value) {
    _imageList = value;
    notifyListeners();
  }

  String get productName => product.name;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  String get thumbnailUrl => product.coverImage;

  String get productDescription => product.description;

  String get price {
    return StringUtils.formatCurrency(
      double.parse(selectedVariation?.price ?? product.basePrice),
      'AED',
    );
  }

  String? get discountedPrice {
    String? oldPriceStr = selectedVariation?.discountedPrice;

    if (oldPriceStr == null) {
      return null;
    }

    double? discountedPrice = double.tryParse(oldPriceStr);
    double price = double.parse(selectedVariation?.price ?? product.basePrice);

    // Do not show slashed off if product increased price
    if (discountedPrice == null || discountedPrice >= price) {
      return null;
    }

    return StringUtils.formatCurrency(discountedPrice!, 'AED');
  }

  get rating => product.rating;

  get languageCode => _appLocalizationService.locale?.languageCode ?? 'en';

  int _quantity = 1;

  int get quantity => _quantity;

  bool get canDecreaseQuantity => quantity > 1;

  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (canDecreaseQuantity) {
      _quantity--;
      notifyListeners();
    }
  }

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  ProductVariation? _selectedVariation;

  ProductVariation? get selectedVariation => _selectedVariation;

  set selectedVariation(ProductVariation? value) {
    _selectedVariation = value;
    notifyListeners();
  }

  Map<String, String> _selectedValues = {};

  Map<String, String> get selectedValues => _selectedValues;

  set selectedValues(Map<String, String> value) {
    _selectedValues = value;
    notifyListeners();
  }

  void optionSelected(String attrKey, String optionKey) {
    selectedValues[attrKey] = optionKey;

    final allSelected = data!.attributes.every(
          (attr) => selectedValues.containsKey(attr.key),
    );

    ProductVariation? matched;

    if (allSelected) {
      matched = data!.variations.firstWhereOrNull(
            (v) => v.attributes.entries.every(
              (entry) => selectedValues[entry.key] == entry.value,
        ),
      );
    } else {
      matched = null;
    }

    selectedVariation = matched;
    notifyListeners();
  }

  Future<void> navigateToProductImagesView() async {
    if (imageList.isNotEmpty) {
      await _routerService.navigateTo(
        ProductImagesViewRoute(
          networkImageList: imageList,
          currentIndex: currentIndex,
          imageType: ImageType.product,
          setCurrentIndex: (int val) {
            currentIndex = val;
          },
        ),
      );

      carouselController.jumpToPage(currentIndex);
    }
  }

  @override
  Future<ProductDetails> futureToRun() async {
    /// Init, remove all images
    imageList = [];
    ProductDetails details = await _api.fetchProductDetails(
      id: product.id.toString(),
      lang: languageCode ?? 'en',
    );

    for (var variation in details.variations) {
      _imageList.addAll(variation.images);
    }

    /// If variation images are empty, use the product's image
    if (imageList.isEmpty) {
      details.images.map((e) => _imageList.add(e.url));
    }

    if (details.variations.isNotEmpty) {
      final first = details.variations.first;

      // Use attributes map directly from variation (e.g., { 'Size': 'S' })
      selectedValues = Map.from(first.attributes);

      final matched = details.variations.firstWhereOrNull(
        (v) => v.attributes.entries.every(
          (entry) => selectedValues[entry.key] == entry.value,
        ),
      );

      selectedVariation = matched;
      notifyListeners();
    }

    return details;
  }
}
