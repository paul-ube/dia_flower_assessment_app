import 'package:flutter/material.dart';

class MinStartColumn extends StatelessWidget {
  final List<Widget> children;

  const MinStartColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
