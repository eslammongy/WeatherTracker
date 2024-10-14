import 'package:flutter/material.dart';

class SkeletonShape extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

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
      child: SizedBox(
        width: width,
        height: height,
        child: AnimatedGradient(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class AnimatedGradient extends StatefulWidget {
  final BorderRadius borderRadius;

  const AnimatedGradient({super.key, required this.borderRadius});

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient>
    with SingleTickerProviderStateMixin {
  // Controller for the animation
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a duration of 3 seconds
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // Make the animation loop
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Calculate the gradient values based on the controller value
          return Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Interpolate between two sets of colors
                  Color.lerp(Colors.grey, Colors.white38, _controller.value)!,
                  Color.lerp(Colors.grey, Colors.white24, _controller.value)!,
                ],
                stops: [_animation.value, 1.0],
              ),
            ),
          );
        },
      ),
    );
  }
}
