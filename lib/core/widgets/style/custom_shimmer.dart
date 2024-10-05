import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'color.dart';

class CustomShimmer extends StatelessWidget {
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final Widget child;

  const CustomShimmer({
    Key? key,
    this.baseShimmerColor,
    this.highlightShimmerColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseShimmerColor ?? AppColors.baserColor,
        highlightColor: highlightShimmerColor ?? AppColors.shimmerColor,
        child: child);
  }
}
