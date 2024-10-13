import 'package:flutter/material.dart';

class SkeletonShape extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const SkeletonShape({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.outline,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
