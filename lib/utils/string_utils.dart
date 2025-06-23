import 'package:dia_flowers_assessment/enums/ui.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static String formatCurrency(double price, String currencyCode) {
    const double currencyFormatLimit = 1000000;

    int decimalDigits = price.truncateToDouble() == price ? 0 : 2;
    const String locale = 'en';

    try {
      var formatCurrency = NumberFormat.simpleCurrency(
        locale: locale,
        name: currencyCode,
        decimalDigits: decimalDigits,
      );

      if (price > currencyFormatLimit) {
        formatCurrency = NumberFormat.compactSimpleCurrency(
          locale: locale,
          name: currencyCode,
          decimalDigits: decimalDigits,
        );
      }

      return formatCurrency.format(
        double.parse(StringUtils.removeDecimalZeroFormat(price)),
      );
    } catch (e) {
      var formatCurrency = NumberFormat.currency(
        locale: locale,
        name: currencyCode,
        decimalDigits: decimalDigits,
      );

      if (price > currencyFormatLimit) {
        formatCurrency = NumberFormat.compactCurrency(
          locale: locale,
          name: currencyCode,
          decimalDigits: decimalDigits,
        );
      }

      return formatCurrency.format(price);
    }
  }

  static String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  static String generateImageHeroTag(ImageType type, String path) {
    late final String prefix;

    /// Add other types of image tag to prevent duplicate hero
    switch (type) {
      case (ImageType.product):
      default:
        prefix = 'product-image-tag';
    }

    return '$prefix-$path';
  }
}
