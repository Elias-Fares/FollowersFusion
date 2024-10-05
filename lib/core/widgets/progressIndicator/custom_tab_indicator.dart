import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/style/color.dart';

Decoration customTabIndicator({required bool isSelected}) {
  return BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: isSelected
            ? AppColors.mainColor
            : AppColors.lightGray,
        width: isSelected ? 2.h : 1.h,
      ),
    ),
  );
}
