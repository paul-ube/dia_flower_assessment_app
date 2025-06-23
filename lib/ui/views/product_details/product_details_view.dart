import 'package:carousel_slider/carousel_slider.dart';
import 'package:dia_flowers_assessment/constants/app_colors.dart';
import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/enums/ui.dart';
import 'package:dia_flowers_assessment/i18n/strings.g.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/blur_status_bar_overlay.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/error_container.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/min_start_column.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/add_to_cart_button/add_to_cart_button.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/product_list_item/product_list_item.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/section_header/section_header.dart';
import 'package:dia_flowers_assessment/utils/string_utils.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:expandable/expandable.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';

import 'product_details_viewmodel.dart';

class ProductDetailsView extends StackedView<ProductDetailsViewModel> {
  const ProductDetailsView({super.key, required this.product});

  final Product product;

  @override
  Widget builder(
    BuildContext context,
    ProductDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [const _CustomAppBar()];
        },
        body: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _MainDetails()),
                if (viewModel.isBusy)
                  SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: constraints.maxHeight / 2,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                if (viewModel.hasError)
                  SliverToBoxAdapter(
                    child: ErrorContainer(
                      message: viewModel.modelError.toString(),
                      retry: () => viewModel.initialise(),
                    ),
                  ),
                if (viewModel.dataReady)
                  SliverList.list(
                    children: [
                      _PriceAndDescription(),
                      _VariationControls(),
                      _StaticData(),
                    ],
                  ),
                if (viewModel.dataReady)
                  MultiSliver(
                    children: [
                      SliverToBoxAdapter(
                        child: SectionHeader(
                          title: t.product_details.you_may_also_like.title,
                          hasInitialPadding: true,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: getProductMaxHeight(context, 2.5),
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(
                                  kProductItemPadding,
                                ).add(
                                  EdgeInsets.only(
                                    left:
                                        index == 0
                                            ? kIndent - kProductItemPadding
                                            : 0,
                                    right:
                                        index == 3
                                            ? kIndent - kProductItemPadding
                                            : 0,
                                  ),
                                ),
                                child: MinStartColumn(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.surfaceContainer,
                                        borderRadius: BorderRadius.circular(
                                          m3MediumShapeRadius,
                                        ),
                                      ),
                                      width: 150,
                                      height: 150,
                                    ),
                                    vSpaceMini,
                                    Text('Price'),
                                    vSpaceSmall,
                                    Text('Sample title'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar:
          !viewModel.dataReady
              ? null
              : AnimatedSize(
                duration: kThemeAnimationDuration,
                child: AddToCartButton(),
              ),
    );
  }

  @override
  ProductDetailsViewModel viewModelBuilder(BuildContext context) =>
      ProductDetailsViewModel(product);
}

class _PriceAndDescription extends ViewModelWidget<ProductDetailsViewModel> {
  const _PriceAndDescription({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    if (!viewModel.dataReady) {
      return const SizedBox.shrink();
    }

    return PaddingWrapper(
      child: MinStartColumn(
        children: [
          vSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(
                    style: textTheme.titleLarge,
                    text: viewModel.discountedPrice ?? viewModel.price,
                    children: [
                      if (viewModel.discountedPrice != null) ...[
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: viewModel.price,
                          style: textTheme.bodySmall?.apply(
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
                  textScaler: MediaQuery.textScalerOf(context),
                ),
              ),
              // _QuantityControls(),
            ],
          ),
          vSpaceMedium,
          Text(
            viewModel.productDescription,
            style: textTheme.bodyMedium?.apply(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _MainDetails extends ViewModelWidget<ProductDetailsViewModel> {
  const _MainDetails({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return PaddingWrapper(
      child: MinStartColumn(
        children: [
          // Inverted stars
          Directionality(
            textDirection: TextDirection.ltr,
            child: RatingStars(
              value: viewModel.rating,
              onValueChanged: (v) {},
              starCount: 5,
              starSize: 10,
              maxValue: 5,
              starSpacing: 2,
              maxValueVisibility: false,
              valueLabelVisibility: false,
              starColor: colorScheme.tertiary,
            ),
          ),
          vSpaceMini,
          Flexible(
            child: Text(
              viewModel.productName,
              style: textTheme.displaySmall?.apply(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Reviews extends StatelessWidget {
  const _Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _QuantityControls extends ViewModelWidget<ProductDetailsViewModel> {
  const _QuantityControls({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filledTonal(
          icon: Icon(Icons.remove),
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          visualDensity: VisualDensity.compact,
          iconSize: 18,
          onPressed:
              !viewModel.canDecreaseQuantity
                  ? null
                  : () => viewModel.decreaseQuantity(),
        ),
        hSpaceSmall,
        Text(
          '${viewModel.quantity}',
          style: textTheme.titleMedium?.copyWith(
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
        hSpaceSmall,
        IconButton.filledTonal(
          icon: Icon(Icons.add),
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          visualDensity: VisualDensity.compact,
          iconSize: 18,
          onPressed: () => viewModel.increaseQuantity(),
        ),
      ],
    );
  }
}

class _VariationControls extends ViewModelWidget<ProductDetailsViewModel> {
  const _VariationControls({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    final colorScheme = Theme.of(context).colorScheme;
    if (!viewModel.dataReady) {
      return const SizedBox.shrink();
    }
    return MinStartColumn(
      children: [
        vSpaceMedium,
        for (var attr in viewModel.data!.attributes) ...[
          SectionHeader(
            title: attr.label, // localized name
            hasInitialPadding: false,
          ),
          PaddingWrapper(
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children:
                  attr.options.map((option) {
                    final isSelected =
                        viewModel.selectedValues[attr.key] == option.key;

                    final isColor = attr.key.toLowerCase().contains('color');

                    return ChoiceChip(
                      label: Text(option.label),
                      onSelected: (_) {
                        viewModel.optionSelected(
                          attr.key,
                          option.key,
                        ); // use keys
                      },
                      selected: isSelected,
                      showCheckmark: false,
                      avatar:
                          isColor
                              ? CircleAvatar(
                                radius: 16,
                                backgroundColor: getColorFromName(option.label),
                                child:
                                    getColorFromName(option.label) ==
                                            Colors.white
                                        ? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                        : null,
                              )
                              : null,
                    );
                  }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}

class _StaticData extends ViewModelWidget<ProductDetailsViewModel> {
  const _StaticData({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    Translations.of(context);
    return MinStartColumn(
      children: [
        _DetailWrapper(
          title: t.product_details.deliveryInfo.title,
          desc: t.product_details.deliveryInfo.desc,
        ),
        _DetailWrapper(
          title: t.product_details.disclaimer.title,
          desc: t.product_details.disclaimer.desc,
        ),
        _DetailWrapper(
          title: t.product_details.our_flowers.title,
          desc: t.product_details.our_flowers.desc,
        ),
      ],
    );
  }
}

class _CustomAppBar extends ViewModelWidget<ProductDetailsViewModel> {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ProductDetailsViewModel viewModel) {
    return SliverAppBar.large(
      pinned: true,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(viewModel.productName),
      ),
      titleSpacing: 0,
      expandedHeight: kProductImageExpandedHeight,
      leading: Center(
        child: Builder(
          builder: (context) {
            final FlexibleSpaceBarSettings settings =
                context
                    .dependOnInheritedWidgetOfExactType<
                      FlexibleSpaceBarSettings
                    >()!;

            bool isCollapsed = settings.isScrolledUnder ?? false;

            return BackButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: isCollapsed ? 0 : 0.8),
              ),
            );
          },
        ),
      ).animate(delay: 150.ms, effects: iconFadeIn),
      actions: !viewModel.dataReady ? null : [_menuButton()],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider.builder(
                  carouselController: viewModel.carouselController,
                  options: CarouselOptions(
                    initialPage: 0,
                    enlargeCenterPage: false,
                    height: kProductImageExpandedHeight + 54,
                    enableInfiniteScroll: false,
                    reverse: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      viewModel.currentIndex = index;
                    },
                  ),
                  itemCount:
                      !viewModel.dataReady ? 1 : viewModel.imageList.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    Function()? onTap =
                        !viewModel.dataReady
                            ? null
                            : () {
                              viewModel.navigateToProductImagesView();
                            };

                    Widget image =
                        !viewModel.dataReady
                            ? ExtendedImage.network(
                              viewModel.thumbnailUrl,
                              fit: BoxFit.cover,
                            )
                            : Hero(
                              tag: StringUtils.generateImageHeroTag(
                                ImageType.product,
                                '${viewModel.imageList[index]}-$index',
                              ),
                              child: ExtendedImage.network(
                                viewModel.imageList.isEmpty
                                    ? viewModel.thumbnailUrl
                                    : viewModel.imageList[index],
                                fit: BoxFit.cover,
                                cache: true,
                              ),
                            );

                    return InkWell(
                      onTap: onTap,
                      child: SizedBox(width: double.maxFinite, child: image),
                    );
                  },
                ),
              ),
            ),
            if (viewModel.imageList.isNotEmpty)
              Positioned(
                bottom: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      viewModel.imageList.length == 1
                          ? Container()
                          : Container(
                            padding: const EdgeInsets.fromLTRB(
                              12,
                              0,
                              16,
                              kProductImageBottomContainerHeight + kIndent,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.onImageTextBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                  m3SmallShapeRadius,
                                ),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4.5),
                              child: Text(
                                '${viewModel.currentIndex + 1} / ${viewModel.imageList.length}',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.apply(color: AppColors.onImageTextColor),
                              ),
                            ),
                          ),
                ),
              ),
            Positioned(
              bottom: -1,
              child: Container(
                height: kProductImageBottomContainerHeight,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(m3ExtraLargeRadius),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BlurStatusBarOverlay(),
            ),
          ],
        ),
      ),
    );
  }

  Builder _menuButton() {
    return Builder(
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(right: 8.0, left: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surface.withValues(
              alpha: appBarIsCollapsed(context) ? 0 : 0.8,
            ),
          ),
          child: MenuAnchor(
            consumeOutsideTap: true,
            alignmentOffset: const Offset(-70, 0),
            builder: (context, controller, child) {
              return IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: Icon(Icons.more_vert),
                tooltip: 'Show menu',
              );
            },
            menuChildren: [
              MenuItemButton(
                child: const Text('Help & Feedback'),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class PaddingWrapper extends StatelessWidget {
  const PaddingWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kIndent),
      child: child,
    );
  }
}

class _DescText extends StatelessWidget {
  const _DescText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return PaddingWrapper(
      child: Text(
        text,
        style: textTheme.bodyMedium?.apply(color: colorScheme.onSurfaceVariant),
      ),
    );
  }
}

class _DetailWrapper extends StatelessWidget {
  const _DetailWrapper({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return MinStartColumn(
      children: [
        vSpaceMedium,
        ExpandablePanel(
          theme: ExpandableThemeData(
            iconPadding: const EdgeInsets.symmetric(horizontal: kIndent),
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            tapBodyToExpand: true,
            tapHeaderToExpand: true,
          ),
          header: SectionHeader(title: title),
          expanded: _DescText(desc),
          collapsed: Container(),
        ),
      ],
    );
  }
}
