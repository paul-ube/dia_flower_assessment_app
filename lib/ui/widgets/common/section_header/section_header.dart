import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:dia_flowers_assessment/ui/widgets/atoms/min_start_column.dart';
import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

enum SectionHeaderType { large, largeWithDivider, normal }

class SectionHeader extends StatelessWidget {
  final String title;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool hasInitialPadding;
  final double minHeight;
  final Widget? trailing;
  final bool dense;
  final String? subtitleText;
  final double? initialPaddingSize;

  const SectionHeader({
    super.key,
    required this.title,
    this.color,
    this.padding,
    this.hasInitialPadding = false,
    this.minHeight = kSectionHeaderHeight,
    this.trailing,
    this.dense = false,
    this.subtitleText,
    this.initialPaddingSize,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextStyle? textStyle = sectionHeaderTextStyle(context);

    /// Can be changed later to apply dynamic padding
    double effectivePadding = kIndent;

    return MinStartColumn(
      children: [
        if (hasInitialPadding) verticalSpace(initialPaddingSize ?? 16),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: kMinInteractiveDimension,
          ),
          child: Padding(
            padding:
                padding ??
                EdgeInsets.fromLTRB(
                  effectivePadding,
                  0,
                  trailing == null ? effectivePadding : 0,
                  0,
                ),
            child: Row(
              children: [
                Expanded(
                  child: MinStartColumn(
                    children: [
                      Text(
                        title,
                        style: textStyle?.apply(color: color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitleText != null) ...[
                        vSpaceMini,
                        Text(
                          subtitleText!,
                          style: textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                trailing ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsetsGeometry? getPadding() {
    /// Can be dynamic
    final indent = kIndent;

    if (trailing == null) {
      return padding ??
          EdgeInsetsDirectional.only(
            start: indent,
            end: indent,
            bottom: 16,
            top: dense ? 12 : 24,
          );
    }

    return padding ??
        EdgeInsetsDirectional.fromSTEB(indent, dense ? 0 : 24, indent, 4);
  }
}
