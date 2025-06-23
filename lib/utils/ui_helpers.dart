import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

const double _microSize = 2;
const double _miniSize = 4;
const double _smallSize = 8;
const double _mediumSize = 16;
const double _largeSize = 24;

const Widget vSpaceMicro = SizedBox(height: _microSize);
const Widget vSpaceMini = SizedBox(height: _miniSize);
const Widget vSpaceSmall = SizedBox(height: _smallSize);
const Widget vSpaceMedium = SizedBox(height: _mediumSize);
const Widget vSpaceLarge = SizedBox(height: _largeSize);

const Widget hSpaceMicro = SizedBox(width: _microSize);
const Widget hSpaceMini = SizedBox(width: _miniSize);
const Widget hSpaceSmall = SizedBox(width: _smallSize);
const Widget hSpaceMedium = SizedBox(width: _mediumSize);
const Widget hSpaceLarge = SizedBox(width: _largeSize);

Widget verticalSpace(double height) => SizedBox(height: height);

/// Huge header height
const double kHugeHeaderHeight = 44;

const double m3ExtraSmallShapeRadius = 4;
const double m3SmallShapeRadius = 8;
const double m3MediumShapeRadius = 12;
const double m3LargeShapeRadius = 16;
const double m3ExtraLargeRadius = 28;

const double m3DefaultCardElevation = 1;

TextStyle? hugeHeaderTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge?.apply(
    fontWeightDelta: 2,
    fontSizeDelta: -1.5,
    letterSpacingDelta: -0.5,
  );
}

TextStyle? sectionHeaderTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge;
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}

Color getDisabledColor(
  BuildContext context, {
  bool onDisabledContainer = false,
}) {
  // Copied from material 3 specs
  double opacity = 0.12;
  if (onDisabledContainer) {
    opacity = 0.38;
  }

  return Theme.of(context).colorScheme.onSurface.withOpacity(opacity);
}

SliverGridDelegate getListingsGridDelegate(BuildContext context) {
  int crossAxisCount = 2;

  if (MediaQuery.sizeOf(context).width >= 640) {
    crossAxisCount = 4;
  }

  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: crossAxisCount,
    crossAxisSpacing: 0,
    mainAxisSpacing: 0,
    mainAxisExtent: getProductMaxHeight(context, crossAxisCount.toDouble()),
  );
}

double bottomNavBarBottomPadding(BuildContext context) {
  return MediaQuery.paddingOf(context).bottom < 24
      ? 24
      : MediaQuery.paddingOf(context).bottom;
}

double getProductMaxHeight(BuildContext context, double crossAxisCount) {
  final textTheme = Theme.of(context).textTheme;

  // Calculate item width based on screen width and column count
  double screenWidth = MediaQuery.sizeOf(context).width;
  double itemWidth =
      (screenWidth / crossAxisCount) -
      ((kProductItemPadding * 2) + 16); // Adjust for padding

  // Calculate item height as the sum of the square size and text height
  double imageHeight = itemWidth; // 1:1 aspect ratio, so height = width
  double priceHeight =
      getTextSize(
        'Hello',
        textTheme.labelLarge!,
      ).height; // Estimate height of price
  double titleHeight =
      (getTextSize(
        'Hello',
        textTheme.bodyMedium!.apply(fontSizeDelta: -1),
      ).height) *
      2;

  double addressHeight = getTextSize('World', textTheme.bodySmall!).height;

  double initialPadding = 8;
  double middlePadding = 4;
  double itemVerticalPadding = kProductItemPadding * 2;

  double itemHeight =
      imageHeight +
      initialPadding +
      priceHeight +
      titleHeight +
      middlePadding +
      addressHeight +
      itemVerticalPadding; // Adding padding

  return itemHeight;
}

Size getTextSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

final List<Effect> iconFadeIn = <Effect>[
  FadeEffect(duration: 200.ms, curve: kEmphasizedAccelerate),
  ScaleEffect(
    delay: 50.ms,
    duration: 200.ms,
    begin: const Offset(0.9, 0.9),
    curve: kEmphasizedAccelerate,
  ),
];

bool appBarIsCollapsed(BuildContext context) {
  final FlexibleSpaceBarSettings? settings =
      context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
  return settings?.isScrolledUnder ?? false;
}

Color getColorFromName(String name) {
  switch (name.toLowerCase()) {
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'red':
      return Colors.red;
    case 'pink':
      return Colors.pink;
    case 'gold':
      return Color(0xFFFFD700);
    case 'kraft':
      return Color(0xFFB89F82);
    // Add more as needed
    default:
      return Colors.grey; // fallback
  }
}
