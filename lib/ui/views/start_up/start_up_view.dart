import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stacked/stacked.dart';

import 'start_up_viewmodel.dart';

class StartUpView extends StackedView<StartUpViewModel> {
  const StartUpView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: LoadingAnimationWidget.bouncingBall(
                color: Theme.of(context).colorScheme.secondary,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartUpViewModel viewModelBuilder(BuildContext context) => StartUpViewModel();

  @override
  void onViewModelReady(StartUpViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
