import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'material_confirm_dialog_model.dart';

const double _graphicSize = 60;

class MaterialConfirmDialog extends StackedView<MaterialConfirmDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MaterialConfirmDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaterialConfirmDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
      scrollable: true,
      // elevation: 4,
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(m3ExtraLargeRadius),
      ),
      alignment: Alignment.center,
      title: Text(request.title ?? ''),
      content: Text(request.description ?? ''),
      buttonPadding: _getButtonPadding(),
      insetPadding: const EdgeInsets.all(24.0),
      actions: [
        if (request.additionalButtonTitle != null)
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(getButtonWidth(context), 40),
            ),
            onPressed: () => completer(DialogResponse(confirmed: false)),
            child: Text(request.additionalButtonTitle!),
          ),
        if (request.mainButtonTitle != null)
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: Size(getButtonWidth(context), 40),
            ),
            onPressed: () => completer(DialogResponse(confirmed: true)),
            child: Text(request.mainButtonTitle!),
          ),
      ],
    );
  }

  @override
  MaterialConfirmDialogModel viewModelBuilder(BuildContext context) =>
      MaterialConfirmDialogModel();
}

getButtonWidth(BuildContext context) =>
    (MediaQuery.sizeOf(context).width / 2) - 52;

EdgeInsetsGeometry _getButtonPadding() =>
    const EdgeInsets.fromLTRB(8, 12, 8, 0);
