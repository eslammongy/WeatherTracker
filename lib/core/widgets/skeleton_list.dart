import 'package:flutter/material.dart';
import 'package:weather_tracker/core/loading_state/skeleton_shape.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 110.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 10),
              child: SkeletonShape(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  width: 130,
                  height: 130),
            );
          },
        ),
      ),
    );
  }
}
