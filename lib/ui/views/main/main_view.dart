import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/model/product/product.dart';
import 'package:dia_flowers_assessment/ui/views/main/main_viewmodel.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/error_container.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/product_list_item/product_list_item.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/theme_toggle_button/theme_toggle_button.dart';
import 'package:dia_flowers_assessment/ui/widgets/common/toggle_locale_button/toggle_locale_button.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget builder(BuildContext context, MainViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Dia Flower Demo'),
        leading: ToggleLocaleButton(viewModel.initialise),
        actions: [ThemeToggleButton()],
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.initialise(),
        child: CustomScrollView(
          slivers: [
            if (viewModel.hasError) _Error(),
            if (viewModel.isBusy) _Busy(),
            if (!viewModel.isBusy && viewModel.products.isEmpty) _Empty(),
            if (!viewModel.isBusy && viewModel.products.isNotEmpty) _Main(),
          ],
        ),
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();
}

class _Error extends ViewModelWidget<MainViewModel> {
  const _Error({super.key});

  @override
  Widget build(BuildContext context, MainViewModel viewModel) {
    return SliverFillRemaining(
      child: Center(
        child: ErrorContainer(
          title: 'Error',
          message: viewModel.modelError.toString(),
          retry: () => viewModel.initialise(),
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(child: Center(child: Text('No products found')));
  }
}

/// Can be skeleton
class _Busy extends StatelessWidget {
  const _Busy({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _Main extends ViewModelWidget<MainViewModel> {
  const _Main({super.key});

  @override
  Widget build(BuildContext context, MainViewModel viewModel) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: kProductsHorizontalPadding),
      sliver: SliverGrid(
        gridDelegate: getListingsGridDelegate(context),
        delegate: SliverChildBuilderDelegate((context, index) {
          final Product product = viewModel.products[index];
          return ProductListItem(
            key: ValueKey<int>(product.id),
            product: product,
          );
        }, childCount: viewModel.products.length),
      ),
    );
  }
}
