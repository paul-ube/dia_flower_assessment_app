///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get locale => 'العربية';
	@override String get appName => 'Dia Flowers';
	@override String hello({required Object name}) => 'مرحبًا ${name}';
	@override late final _TranslationsGeneralAr general = _TranslationsGeneralAr._(_root);
	@override late final _TranslationsProductDetailsAr product_details = _TranslationsProductDetailsAr._(_root);
	@override late final _TranslationsButtonsAr buttons = _TranslationsButtonsAr._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'ar': 'العربية',
	};
}

// Path: general
class _TranslationsGeneralAr implements TranslationsGeneralEn {
	_TranslationsGeneralAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get description => 'الوصف';
	@override String get location => 'الموقع';
	@override String get category => 'الفئة';
	@override String get price => 'السعر';
	@override String get disclaimer => 'إخلاء المسؤولية';
}

// Path: product_details
class _TranslationsProductDetailsAr implements TranslationsProductDetailsEn {
	_TranslationsProductDetailsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsProductDetailsDeliveryInfoAr deliveryInfo = _TranslationsProductDetailsDeliveryInfoAr._(_root);
	@override late final _TranslationsProductDetailsDisclaimerAr disclaimer = _TranslationsProductDetailsDisclaimerAr._(_root);
	@override late final _TranslationsProductDetailsOurFlowersAr our_flowers = _TranslationsProductDetailsOurFlowersAr._(_root);
	@override late final _TranslationsProductDetailsYouMayAlsoLikeAr you_may_also_like = _TranslationsProductDetailsYouMayAlsoLikeAr._(_root);
}

// Path: buttons
class _TranslationsButtonsAr implements TranslationsButtonsEn {
	_TranslationsButtonsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'أضف إلى السلة';
}

// Path: product_details.deliveryInfo
class _TranslationsProductDetailsDeliveryInfoAr implements TranslationsProductDetailsDeliveryInfoEn {
	_TranslationsProductDetailsDeliveryInfoAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات توصيل الزهور';
	@override String get desc => 'خدمة توصيل الزهور متوفرة في دبي وأبو ظبي والشارقة وعجمان ورأس الخيمة وأم القيوين والفجيرة. عند طلب الزهور عبر الإنترنت، سنضمن استلامك للزهور خلال فترة التوصيل التي اخترتها.';
}

// Path: product_details.disclaimer
class _TranslationsProductDetailsDisclaimerAr implements TranslationsProductDetailsDisclaimerEn {
	_TranslationsProductDetailsDisclaimerAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إخلاء المسؤولية';
	@override String get desc => 'الصور المعروضة هي لأغراض التوضيح فقط. قد يختلف المنتج الفعلي بسبب تحسين المنتج أو توفر المواد. قد تظهر الألوان مختلفة قليلاً بسبب الإضاءة الفوتوغرافية أو إعدادات الشاشة الخاصة بك. نحتفظ بالحق في إجراء تعديلات طفيفة على التصاميم لضمان أفضل جودة للمنتج.';
}

// Path: product_details.our_flowers
class _TranslationsProductDetailsOurFlowersAr implements TranslationsProductDetailsOurFlowersEn {
	_TranslationsProductDetailsOurFlowersAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'زهورنا';
	@override String get desc => 'يتم اختيار زهورنا بعناية ومصدرها من أفضل المزارعين. نقدم مجموعة واسعة من الزهور الطازجة، والورود المحفوظة، والترتيبات الاصطناعية لتناسب كل مناسبة. يضمن فريقنا من منسقي الزهور الخبراء أن كل باقة يتم تصميمها بعناية واهتمام بالتفاصيل، مما يضمن أعلى جودة ونضارة.';
}

// Path: product_details.you_may_also_like
class _TranslationsProductDetailsYouMayAlsoLikeAr implements TranslationsProductDetailsYouMayAlsoLikeEn {
	_TranslationsProductDetailsYouMayAlsoLikeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'قد ترغب أيضا';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'locale': return 'العربية';
			case 'appName': return 'Dia Flowers';
			case 'hello': return ({required Object name}) => 'مرحبًا ${name}';
			case 'general.description': return 'الوصف';
			case 'general.location': return 'الموقع';
			case 'general.category': return 'الفئة';
			case 'general.price': return 'السعر';
			case 'general.disclaimer': return 'إخلاء المسؤولية';
			case 'product_details.deliveryInfo.title': return 'معلومات توصيل الزهور';
			case 'product_details.deliveryInfo.desc': return 'خدمة توصيل الزهور متوفرة في دبي وأبو ظبي والشارقة وعجمان ورأس الخيمة وأم القيوين والفجيرة. عند طلب الزهور عبر الإنترنت، سنضمن استلامك للزهور خلال فترة التوصيل التي اخترتها.';
			case 'product_details.disclaimer.title': return 'إخلاء المسؤولية';
			case 'product_details.disclaimer.desc': return 'الصور المعروضة هي لأغراض التوضيح فقط. قد يختلف المنتج الفعلي بسبب تحسين المنتج أو توفر المواد. قد تظهر الألوان مختلفة قليلاً بسبب الإضاءة الفوتوغرافية أو إعدادات الشاشة الخاصة بك. نحتفظ بالحق في إجراء تعديلات طفيفة على التصاميم لضمان أفضل جودة للمنتج.';
			case 'product_details.our_flowers.title': return 'زهورنا';
			case 'product_details.our_flowers.desc': return 'يتم اختيار زهورنا بعناية ومصدرها من أفضل المزارعين. نقدم مجموعة واسعة من الزهور الطازجة، والورود المحفوظة، والترتيبات الاصطناعية لتناسب كل مناسبة. يضمن فريقنا من منسقي الزهور الخبراء أن كل باقة يتم تصميمها بعناية واهتمام بالتفاصيل، مما يضمن أعلى جودة ونضارة.';
			case 'product_details.you_may_also_like.title': return 'قد ترغب أيضا';
			case 'buttons.addToCart': return 'أضف إلى السلة';
			case 'locales.en': return 'English';
			case 'locales.ar': return 'العربية';
			default: return null;
		}
	}
}

