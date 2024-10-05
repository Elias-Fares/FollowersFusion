import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import '../button/custom_ink_well.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final double? titleSize;
  final FontWeight titleFontWeight;
  final EdgeInsetsGeometry? padding;

  const TitleCard(
      {Key? key,
      required this.title,
      this.onTap,
      this.titleSize,
      this.titleFontWeight = FontWeight.w700,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 26.w),
      child: Row(
        mainAxisAlignment: onTap != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseText(
              title: title,
              fontWeight: FontWeight.w700,
              size: titleSize ?? 14.sp,
              color: AppColors.thirdMainColor),
          if (onTap != null) ...[
            CustomInkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(2.r),
              child: BaseText(
                  title: LocalKeys.view_all.tr,
                  color: AppColors.iconColorV1,
                  size: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ]
        ],
      ),
    );
  }
}
