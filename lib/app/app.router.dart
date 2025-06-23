// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:stacked/stacked.dart' as _i6;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../enums/ui.dart' as _i9;
import '../model/product/product.dart' as _i8;
import '../ui/views/main/main_view.dart' as _i2;
import '../ui/views/product_details/product_details_view.dart' as _i3;
import '../ui/views/product_images/product_images_view.dart' as _i4;
import '../ui/views/start_up/start_up_view.dart' as _i1;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i5.StackedService.navigatorKey);

class StackedRouterWeb extends _i6.RootStackRouter {
  StackedRouterWeb({_i7.GlobalKey<_i7.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartUpView(),
      );
    },
    MainViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainView(),
      );
    },
    ProductDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsViewArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailsView(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductImagesViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProductImagesViewArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ProductImagesView(
          key: args.key,
          networkImageList: args.networkImageList,
          currentIndex: args.currentIndex,
          imageType: args.imageType,
          setCurrentIndex: args.setCurrentIndex,
        ),
        opaque: false,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          StartUpViewRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          MainViewRoute.name,
          path: '/main-view',
        ),
        _i6.RouteConfig(
          ProductDetailsViewRoute.name,
          path: '/product-details-view',
        ),
        _i6.RouteConfig(
          ProductImagesViewRoute.name,
          path: '/product-images-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i6.PageRouteInfo<void> {
  const StartUpViewRoute()
      : super(
          StartUpViewRoute.name,
          path: '/',
        );

  static const String name = 'StartUpView';
}

/// generated route for
/// [_i2.MainView]
class MainViewRoute extends _i6.PageRouteInfo<void> {
  const MainViewRoute()
      : super(
          MainViewRoute.name,
          path: '/main-view',
        );

  static const String name = 'MainView';
}

/// generated route for
/// [_i3.ProductDetailsView]
class ProductDetailsViewRoute
    extends _i6.PageRouteInfo<ProductDetailsViewArgs> {
  ProductDetailsViewRoute({
    _i7.Key? key,
    required _i8.Product product,
  }) : super(
          ProductDetailsViewRoute.name,
          path: '/product-details-view',
          args: ProductDetailsViewArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailsView';
}

class ProductDetailsViewArgs {
  const ProductDetailsViewArgs({
    this.key,
    required this.product,
  });

  final _i7.Key? key;

  final _i8.Product product;

  @override
  String toString() {
    return 'ProductDetailsViewArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ProductImagesView]
class ProductImagesViewRoute extends _i6.PageRouteInfo<ProductImagesViewArgs> {
  ProductImagesViewRoute({
    _i7.Key? key,
    required List<String> networkImageList,
    required int currentIndex,
    required _i9.ImageType imageType,
    required dynamic Function(int) setCurrentIndex,
  }) : super(
          ProductImagesViewRoute.name,
          path: '/product-images-view',
          args: ProductImagesViewArgs(
            key: key,
            networkImageList: networkImageList,
            currentIndex: currentIndex,
            imageType: imageType,
            setCurrentIndex: setCurrentIndex,
          ),
        );

  static const String name = 'ProductImagesView';
}

class ProductImagesViewArgs {
  const ProductImagesViewArgs({
    this.key,
    required this.networkImageList,
    required this.currentIndex,
    required this.imageType,
    required this.setCurrentIndex,
  });

  final _i7.Key? key;

  final List<String> networkImageList;

  final int currentIndex;

  final _i9.ImageType imageType;

  final dynamic Function(int) setCurrentIndex;

  @override
  String toString() {
    return 'ProductImagesViewArgs{key: $key, networkImageList: $networkImageList, currentIndex: $currentIndex, imageType: $imageType, setCurrentIndex: $setCurrentIndex}';
  }
}

extension RouterStateExtension on _i5.RouterService {
  Future<dynamic> navigateToStartUpView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartUpViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProductDetailsView({
    _i7.Key? key,
    required _i8.Product product,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProductDetailsViewRoute(
        key: key,
        product: product,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProductImagesView({
    _i7.Key? key,
    required List<String> networkImageList,
    required int currentIndex,
    required _i9.ImageType imageType,
    required dynamic Function(int) setCurrentIndex,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProductImagesViewRoute(
        key: key,
        networkImageList: networkImageList,
        currentIndex: currentIndex,
        imageType: imageType,
        setCurrentIndex: setCurrentIndex,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartUpView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartUpViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProductDetailsView({
    _i7.Key? key,
    required _i8.Product product,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProductDetailsViewRoute(
        key: key,
        product: product,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProductImagesView({
    _i7.Key? key,
    required List<String> networkImageList,
    required int currentIndex,
    required _i9.ImageType imageType,
    required dynamic Function(int) setCurrentIndex,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProductImagesViewRoute(
        key: key,
        networkImageList: networkImageList,
        currentIndex: currentIndex,
        imageType: imageType,
        setCurrentIndex: setCurrentIndex,
      ),
      onFailure: onFailure,
    );
  }
}
