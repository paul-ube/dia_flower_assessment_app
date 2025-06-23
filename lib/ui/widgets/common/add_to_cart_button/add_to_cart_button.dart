import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_to_cart_button_model.dart';

class AddToCartButton extends StackedView<AddToCartButtonModel> {
  const AddToCartButton({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddToCartButtonModel viewModel,
    Widget? child,
  ) {
    Translations.of(context);
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      padding: EdgeInsets.fromLTRB(
        kIndent,
        16,
        kIndent,
        bottomNavBarBottomPadding(context),
      ),
      child: FilledButton.icon(
        onPressed: () {},
        style: FilledButton.styleFrom(
          minimumSize: Size(64, kMinInteractiveDimension),
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.apply(fontSizeDelta: 2),
        ),
        icon: Icon(Icons.shopping_cart_outlined),
        label: Text(t.buttons.addToCart),
      ),
    );
  }

  @override
  AddToCartButtonModel viewModelBuilder(BuildContext context) =>
      AddToCartButtonModel();
}
