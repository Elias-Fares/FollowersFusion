import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class DottedDivider extends StatelessWidget {
  final double? dashWidth;
  final double? dashHeight;
  final Color color;
  final Axis? direction;
  final Widget? child;

  const DottedDivider(
      {Key? key,
      this.dashWidth,
      this.color = AppColors.mainColor,
      this.dashHeight,
      this.direction, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = this.dashWidth ?? 10.0;
        final dashHeight = this.dashHeight ?? .5.h;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction?? Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return child?? SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
