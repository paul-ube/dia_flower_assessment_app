import 'package:dia_flowers_assessment/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  final String title;
  final Color? color;
  final Widget? icon;

  /// The color of the background. If null, add opacity to color instead.
  final Color? backgroundColor;

  /// just for the setting the color to colorScheme.onSurfaceVariant
  /// if set to false
  final bool isPrimary;

  final int? fontWeightDelta;
  final double fontSizeDelta;

  final bool dense;

  const StatusTag({
    super.key,
    required this.title,
    this.color,
    this.isPrimary = true,
    this.backgroundColor,
    this.icon,
    this.fontWeightDelta,
    this.fontSizeDelta = -1,
    this.dense = false,
  });

  Color finalColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color finalColor;

    if (!isPrimary) {
      finalColor = colorScheme.onSurfaceVariant;
    } else {
      finalColor = color ?? colorScheme.onTertiaryContainer;
    }

    return finalColor;
  }

  Color bgColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Color foregroundColor;

    if (backgroundColor != null) {
      foregroundColor = backgroundColor!;
    }

    if (!isPrimary) {
      foregroundColor =
          isDarkMode(context)
              ? colorScheme.surfaceContainerHighest
              : colorScheme.surfaceContainer;
    } else {
      foregroundColor =
          color?.withValues(alpha: 0.12) ?? colorScheme.tertiaryContainer;
    }

    return Color.alphaBlend(foregroundColor, colorScheme.surface);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveFontSizeDelta = dense ? fontSizeDelta - 1 : fontSizeDelta;

    final horizontalPadding = dense ? 6.0 : 8.0;
    final verticalPadding = dense ? 4.0 : 6.0;
    return Container(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        verticalPadding - 1,
        horizontalPadding,
        verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          dense ? m3ExtraSmallShapeRadius : m3SmallShapeRadius,
        ),
        color: bgColor(context),
      ),
      child: _buildText(context, finalColor(context), effectiveFontSizeDelta),
    );
  }

  Widget _buildText(
    BuildContext context,
    Color finalColor,
    double effectiveFontSizeDelta,
  ) {
    Widget text = Text(
      title,
      style: Theme.of(context).textTheme.labelLarge?.apply(
        color: finalColor,
        fontSizeDelta: effectiveFontSizeDelta,
        letterSpacingDelta: 0.2,
        fontWeightDelta: fontWeightDelta ?? 1,
      ),
    );

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon!, hSpaceMini, text],
      );
    }

    return text;
  }
}
