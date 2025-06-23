import 'package:dia_flowers_assessment/enums/ui.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/min_start_column.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/status_tag.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:extended_image/extended_image.dart';

import 'product_list_item_model.dart';

class ProductListItem extends StackedView<ProductListItemModel> {
  const ProductListItem({
    super.key,
    required this.product,
    this.variant = ProductItemType.grid,
  });

  final Product product;
  final ProductItemType variant;

  @override
  Widget builder(
    BuildContext context,
    ProductListItemModel viewModel,
    Widget? child,
  ) {
    if (variant == ProductItemType.grid) {
      return const _Grid();
    }

    return Container();
  }

  @override
  ProductListItemModel viewModelBuilder(BuildContext context) =>
      ProductListItemModel(product);
}

class _Grid extends ViewModelWidget<ProductListItemModel> {
  const _Grid({super.key});

  @override
  Widget build(BuildContext context, ProductListItemModel viewModel) {
    return InkWell(
      key: ValueKey<int>(viewModel.product.id),
      onTap: () {
        viewModel.navigateToDetailsView();
      },
      borderRadius: BorderRadius.circular(m3LargeShapeRadius),
      child: Padding(
        padding: const EdgeInsets.all(kProductItemPadding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final theme = Theme.of(context);
            final textTheme = theme.textTheme;
            final colorScheme = theme.colorScheme;
            return MinStartColumn(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(m3LargeShapeRadius),
                  child: AspectRatio(
                    aspectRatio: 4 / 4,
                    child: ExtendedImage.network(
                      viewModel.thumbnailUrl,
                      fit: BoxFit.cover,
                      cache: true,
                      loadStateChanged: (ExtendedImageState state) {
                        if (state.extendedImageLoadState ==
                            LoadState.loading) {
                          return Container(
                            decoration: BoxDecoration(
                              color:
                              Theme.of(
                                context,
                              ).colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(
                                m3LargeShapeRadius,
                              ),
                            ),
                          );
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSpaceSmall,
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            style: textTheme.labelLarge,
                            text:
                                'From ${viewModel.discountedPrice ?? viewModel.basePrice}',
                            children: [
                              if (viewModel.discountedPrice != null) ...[
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: viewModel.basePrice,
                                  style: textTheme.bodySmall?.apply(
                                    fontWeightDelta: 1,
                                    color: getDisabledColor(
                                      context,
                                      onDisabledContainer: true,
                                    ),
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: getDisabledColor(
                                      context,
                                      onDisabledContainer: true,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      vSpaceMini,
                      Text(
                        viewModel.title,
                        style: textTheme.titleMedium?.apply(fontSizeDelta: 2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
