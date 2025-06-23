///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get locale => 'English';
	String get appName => 'Dia Flowers';
	String hello({required Object name}) => 'Hello ${name}';
	late final TranslationsGeneralEn general = TranslationsGeneralEn._(_root);
	late final TranslationsProductDetailsEn product_details = TranslationsProductDetailsEn._(_root);
	late final TranslationsButtonsEn buttons = TranslationsButtonsEn._(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'ar': 'Arabic',
	};
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get description => 'Description';
	String get location => 'Location';
	String get category => 'Category';
	String get price => 'Price';
	String get disclaimer => 'Disclaimer';
}

// Path: product_details
class TranslationsProductDetailsEn {
	TranslationsProductDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsProductDetailsDeliveryInfoEn deliveryInfo = TranslationsProductDetailsDeliveryInfoEn._(_root);
	late final TranslationsProductDetailsDisclaimerEn disclaimer = TranslationsProductDetailsDisclaimerEn._(_root);
	late final TranslationsProductDetailsOurFlowersEn our_flowers = TranslationsProductDetailsOurFlowersEn._(_root);
	late final TranslationsProductDetailsYouMayAlsoLikeEn you_may_also_like = TranslationsProductDetailsYouMayAlsoLikeEn._(_root);
}

// Path: buttons
class TranslationsButtonsEn {
	TranslationsButtonsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get addToCart => 'Add to cart';
}

// Path: product_details.deliveryInfo
class TranslationsProductDetailsDeliveryInfoEn {
	TranslationsProductDetailsDeliveryInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delivery Info';
	String get desc => 'Our flower delivery service is available in Dubai, Abu Dhabi, Sharjah, Ajman, Ras Al Khaimah, Umm Al Quwain and Fujairah. When you order flowers online, we will ensure that you receive your flowers within the delivery time slot you\'ve selected.';
}

// Path: product_details.disclaimer
class TranslationsProductDetailsDisclaimerEn {
	TranslationsProductDetailsDisclaimerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Disclaimer';
	String get desc => 'The images shown are for illustration purposes only. Actual product may vary due to product enhancement or availability of materials. Colors may appear slightly different due to photographic lighting or your screen settings. We reserve the right to make minor adjustments to designs to ensure the best quality product.';
}

// Path: product_details.our_flowers
class TranslationsProductDetailsOurFlowersEn {
	TranslationsProductDetailsOurFlowersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Our flowers';
	String get desc => 'Our flowers are carefully selected and sourced from the finest growers. We offer a wide variety of fresh-cut flowers, preserved roses, and artificial arrangements to suit every occasion. Our team of expert florists ensures that each bouquet is crafted with care and attention to detail, guaranteeing the highest quality and freshness.';
}

// Path: product_details.you_may_also_like
class TranslationsProductDetailsYouMayAlsoLikeEn {
	TranslationsProductDetailsYouMayAlsoLikeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'You may also like';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'locale': return 'English';
			case 'appName': return 'Dia Flowers';
			case 'hello': return ({required Object name}) => 'Hello ${name}';
			case 'general.description': return 'Description';
			case 'general.location': return 'Location';
			case 'general.category': return 'Category';
			case 'general.price': return 'Price';
			case 'general.disclaimer': return 'Disclaimer';
			case 'product_details.deliveryInfo.title': return 'Delivery Info';
			case 'product_details.deliveryInfo.desc': return 'Our flower delivery service is available in Dubai, Abu Dhabi, Sharjah, Ajman, Ras Al Khaimah, Umm Al Quwain and Fujairah. When you order flowers online, we will ensure that you receive your flowers within the delivery time slot you\'ve selected.';
			case 'product_details.disclaimer.title': return 'Disclaimer';
			case 'product_details.disclaimer.desc': return 'The images shown are for illustration purposes only. Actual product may vary due to product enhancement or availability of materials. Colors may appear slightly different due to photographic lighting or your screen settings. We reserve the right to make minor adjustments to designs to ensure the best quality product.';
			case 'product_details.our_flowers.title': return 'Our flowers';
			case 'product_details.our_flowers.desc': return 'Our flowers are carefully selected and sourced from the finest growers. We offer a wide variety of fresh-cut flowers, preserved roses, and artificial arrangements to suit every occasion. Our team of expert florists ensures that each bouquet is crafted with care and attention to detail, guaranteeing the highest quality and freshness.';
			case 'product_details.you_may_also_like.title': return 'You may also like';
			case 'buttons.addToCart': return 'Add to cart';
			case 'locales.en': return 'English';
			case 'locales.ar': return 'Arabic';
			default: return null;
		}
	}
}

