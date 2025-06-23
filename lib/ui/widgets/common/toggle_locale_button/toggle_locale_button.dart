import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'toggle_locale_button_model.dart';

class ToggleLocaleButton extends StackedView<ToggleLocaleButtonModel> {
  const ToggleLocaleButton(this.initialize, {super.key});

  final Function() initialize;

  @override
  Widget builder(
    BuildContext context,
    ToggleLocaleButtonModel viewModel,
    Widget? child,
  ) {
    TranslationProvider.of(context);
    return MenuAnchor(
      consumeOutsideTap: true,
      // alignmentOffset: const Offset(-70, 0),
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: Icon(Icons.language),
        );
      },
      menuChildren: [
        ...AppLocale.values.map((locale) {
          AppLocale activeLocale = LocaleSettings.currentLocale;

          // typed version is preferred to avoid typos
          bool active = activeLocale == locale;

          return MenuItemButton(
            onPressed: () async {
              await viewModel.changeLocale(locale.languageCode);

              if (locale == null) {
                LocaleSettings.useDeviceLocale();
              } else {
                LocaleSettings.setLocale(locale);
              }
              initialize();
            },
            trailingIcon:
                locale.languageTag == viewModel.activeLocale?.languageTag
                    ? const Icon(Icons.check)
                    : null,
            child: Text(t.locales[locale.languageTag] ?? 'System'),
          );
        }),
      ],
    );
  }

  @override
  ToggleLocaleButtonModel viewModelBuilder(BuildContext context) =>
      ToggleLocaleButtonModel();
}
