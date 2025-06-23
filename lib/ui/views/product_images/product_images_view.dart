import 'dart:io';
import 'dart:math' as math;

import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/ui/views/product_images/product_images_viewmodel.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/image_hero_widget/image_hero_widget.dart';
import 'package:dia_flowers_assessment/utils/string_utils.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:dia_flowers_assessment/enums/ui.dart';

class ProductImagesView extends StatefulWidget {
  final List<String> networkImageList;
  final int currentIndex;

  /// enum to determine the hero tag
  final ImageType imageType;

  /// Set the current index on listing details view
  final Function(int) setCurrentIndex;

  const ProductImagesView({
    super.key,
    required this.networkImageList,
    required this.currentIndex,
    required this.imageType,
    required this.setCurrentIndex,
  });

  @override
  State<ProductImagesView> createState() => _ProductImagesViewState();
}

class _ProductImagesViewState extends State<ProductImagesView> {
  GlobalKey<ExtendedImageSlidePageState> slidePageKey =
      GlobalKey<ExtendedImageSlidePageState>();

  double opacity = 1.0;
  Color? _backgroundColor;
  late final Color surfaceColor;
  final double maxAlphaOpacity = 1.0;
  bool _initialized = false;

  Duration animatedOpacityDuration = Duration(milliseconds: 250);

  List<String> _networkImageList = [];
  final List<int> _cachedIndexes = <int>[];

  @override
  void initState() {
    _networkImageList = widget.networkImageList;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      surfaceColor =
          isDarkMode(context)
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.inverseSurface;
      _initialized = true;
    }
    _preloadImage(1);
  }

  void _preloadImage(int index) {
    if (_cachedIndexes.contains(index)) {
      return;
    }
    if (0 <= index && index < _networkImageList.length) {
      // final String path = widget.imageList[index];
      precacheImage(
        ExtendedNetworkImageProvider(_networkImageList[index], cache: true),
        context,
      );

      _cachedIndexes.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductImagesViewModel>.reactive(
      viewModelBuilder:
          () =>
              ProductImagesViewModel(_networkImageList, widget.setCurrentIndex),
      onViewModelReady: (viewModel) => viewModel.setIndex(widget.currentIndex),
      builder: (context, viewModel, child) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: CloseButton(
              style: IconButton.styleFrom(foregroundColor: Colors.white),
            ),
            toolbarOpacity: opacity,
            backgroundColor: Colors.transparent,
            title: AnimatedOpacity(
              opacity: opacity,
              duration: animatedOpacityDuration,
              curve: kEmphasizedDecelerate,
              child: Text(
                '${viewModel.currentIndex + 1} of ${viewModel.imageList.length}',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.apply(color: Colors.white),
                key: ValueKey<int>(viewModel.currentIndex),
              ),
            ),
          ),
          body: ExtendedImageSlidePage(
            key: slidePageKey,
            slideAxis: SlideAxis.vertical,
            slideType: SlideType.onlyImage,
            resetPageDuration: Duration(milliseconds: 250),
            slidePageBackgroundHandler: (offset, size) {
              double opacity = 0.0;
              opacity = offset.dy.abs() / (size.height / 5);

              this.opacity = math.max(1.0 - opacity, 0);

              _backgroundColor = surfaceColor.withValues(
                alpha: math.min(maxAlphaOpacity, math.max(1.0 - opacity, 0.0)),
              );

              return _backgroundColor!;
            },
            onSlidingPage: (state) {
              setState(() {
                opacity = (state.isSliding) ? 0 : 1;
              });
            },
            slideScaleHandler: (
              Offset offset, {
              ExtendedImageSlidePageState? state,
            }) {
              double scale =
                  offset.dy.abs() /
                  (state?.pageSize.height ??
                      MediaQuery.sizeOf(context).height / 2.0);

              return math.max(1.0 - scale, 0.9);
            },
            child: ExtendedImageGesturePageView.builder(
              controller: ExtendedPageController(
                initialPage: viewModel.currentIndex,
                pageSpacing: 0,
              ),
              onPageChanged: (int page) {
                _preloadImage(page - 1);
                _preloadImage(page + 1);
                viewModel.onPageChanged(page);
              },
              itemCount: viewModel.imageList.length,
              itemBuilder: (BuildContext context, int index) {
                final String imagePath = viewModel.imageList[index];
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: m3ToolbarHeight + 8),
                    // to mock center
                    child: ImageHeroWidget(
                      tag: StringUtils.generateImageHeroTag(
                        widget.imageType,
                        '$imagePath-$index',
                      ),
                      slidePageKey: slidePageKey,
                      slideType: SlideType.onlyImage,
                      child: _ImageItem(
                        path: imagePath,
                        updateOpacity: (scale) {
                          setState(() {
                            opacity = scale <= 1.0 ? 1.0 : 0.0;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _ImageItem extends StatelessWidget {
  final String path;
  final Function(double) updateOpacity;

  const _ImageItem({
    super.key,
    required this.path,
    required this.updateOpacity,
  });

  @override
  Widget build(BuildContext context) {
    const BoxFit boxFit = BoxFit.contain;
    const bool enableSlideOutPage = true;
    const ExtendedImageMode mode = ExtendedImageMode.gesture;
    const bool cacheRawData = false;

    final layoutInsets = EdgeInsets.only(
      left: 8,
      right: 8,
      top: MediaQuery.paddingOf(context).top,
    );

    var x = GestureConfig(
      inPageView: true,
      initialScale: 1.0,
      maxScale: 5.0,
      minScale: 1.0,
      animationMaxScale: 6.0,
      initialAlignment: InitialAlignment.center,
      gestureDetailsIsChanged: (details) {
        final scale = details?.totalScale ?? 1.0;

        updateOpacity(scale);
      },
    );

    onDoubleTap(state) {
      final double? begin = state.gestureDetails!.totalScale;
      double end = 1;

      if (begin == 1) end = 2;

      state.handleDoubleTap(scale: end);
    }

    if (path.startsWith('http') || path.startsWith('https')) {
      return ExtendedImage.network(
        path,
        fit: boxFit,
        enableSlideOutPage: enableSlideOutPage,
        mode: mode,
        cache: true,
        initGestureConfigHandler: (ExtendedImageState state) => x,
        onDoubleTap: onDoubleTap,
        layoutInsets: layoutInsets,
      );
    } else {
      return ExtendedImage.file(
        File(path),
        fit: boxFit,
        enableSlideOutPage: enableSlideOutPage,
        mode: mode,
        cacheRawData: cacheRawData,
        initGestureConfigHandler: (ExtendedImageState state) => x,
        onDoubleTap: onDoubleTap,
        layoutInsets: layoutInsets,
      );
    }
  }
}
