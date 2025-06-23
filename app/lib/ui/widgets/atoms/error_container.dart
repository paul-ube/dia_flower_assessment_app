import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final Function()? retry;
  final String message;
  final String? title;
  final String retryText;

  /// typically an IconWidget to show error
  final Widget? child;

  const ErrorContainer({
    super.key,
    this.retry,
    required this.message,
    this.title,
    this.child,
    this.retryText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kIndent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (child != null)
              Padding(
                padding: const EdgeInsets.only(bottom: kIndent),
                child: child,
              ),
            _buildTitle(context),
            vSpaceSmall,
            _buildMessage(context),
            vSpaceMedium,
            if (retry != null)
              FilledButton(onPressed: retry, child: Text(retryText)),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (title == null) {
      return const SizedBox.shrink();
    } else {
      return Text(title!, style: Theme.of(context).textTheme.headlineSmall);
    }
  }

  Widget _buildMessage(BuildContext context) {
    int fontWeightDelta = 0;
    Color? color = Theme.of(context).colorScheme.onSurfaceVariant;

    if (title != null) {
      color = Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.87);
    }

    return Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.apply(
        fontWeightDelta: fontWeightDelta,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
