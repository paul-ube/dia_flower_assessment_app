import 'package:dia_flowers_assessment/constants/app_constants.dart';
import 'package:flutter/material.dart';

/// Widget used on listing details view, or any views that covers the status bar
class BlurStatusBarOverlay extends StatelessWidget {
  const BlurStatusBarOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.paddingOf(context).top + m3ToolbarHeight / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0),
                Colors.black.withValues(alpha: 0.33),
              ],
              // stops: const [0, 0.5],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
