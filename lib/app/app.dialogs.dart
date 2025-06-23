// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/dismiss/dismiss_dialog.dart';
import '../ui/dialogs/material_confirm/material_confirm_dialog.dart';

enum DialogType {
  dismiss,
  materialConfirm,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.dismiss: (context, request, completer) =>
        DismissDialog(request: request, completer: completer),
    DialogType.materialConfirm: (context, request, completer) =>
        MaterialConfirmDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
