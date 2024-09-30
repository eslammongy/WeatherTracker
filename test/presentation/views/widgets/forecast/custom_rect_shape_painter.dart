import 'package:flutter/material.dart';

class CustomRectShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create the paint with gradient
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF5E17EB), Color(0xFF5700C4)], // Gradient colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Define the path for the slanted rectangle
    final Path path = Path()
      ..moveTo(0, 0) // Start at the top-left corner
      ..lineTo(
          size.width, size.height * 0.45) // Draw line to the top-right corner
      ..lineTo(size.width, size.height) // Draw line to 25% height at the right
      ..lineTo(0, size.width) // Draw line to the bottom-left corner
      ..close(); // Close the path

    // Define the rounded rectangle with a custom radius for rounded corners
    final RRect roundedRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
      topRight: const Radius.circular(20),
      topLeft: const Radius.circular(20),
    );

    // Clip the path to apply rounded corners
    canvas.clipRRect(roundedRect);

    // Draw the slanted rectangle with the gradient
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
