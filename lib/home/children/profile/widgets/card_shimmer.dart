import 'package:flutter/material.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key, required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.red.withAlpha(50),
      highlightColor: MyColors.red.withAlpha(80),
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 2,
        ),
      ),
    );
  }
}
