import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/min_start_column.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class HugeHeader extends StatelessWidget {
  const HugeHeader({
    super.key,
    required this.title,
    this.trailing,
    this.hasInitialPadding = false,
  });

  final String title;
  final Widget? trailing;
  final bool hasInitialPadding;

  @override
  Widget build(BuildContext context) {
    return MinStartColumn(
      children: [
        if (hasInitialPadding) vSpaceMedium,
        SizedBox(
          height: kHugeHeaderHeight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              kIndent,
              0,
              trailing == null ? kIndent : 0,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(title, style: hugeHeaderTextStyle(context)),
                ),
                trailing ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        vSpaceSmall,
      ],
    );
  }
}
