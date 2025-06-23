import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dismiss_dialog_model.dart';

const double _graphicSize = 60;

class DismissDialog extends StackedView<DismissDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DismissDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DismissDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.end,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(m3ExtraLargeRadius),
      ),
      alignment: Alignment.center,
      title: Text(request.title ?? ''),
      content: Text(request.description ?? ''),
      actionsPadding: const EdgeInsets.only(
        left: kIndent,
        right: kIndent,
        bottom: 18,
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            minimumSize:
                request.mainButtonTitle != null ? null : const Size(48, 40),
          ),
          onPressed: () => completer(DialogResponse(confirmed: true)),
          child: Text(request.mainButtonTitle ?? 'OK'),
        ),
      ],
    );
  }

  @override
  DismissDialogModel viewModelBuilder(BuildContext context) =>
      DismissDialogModel();
}
