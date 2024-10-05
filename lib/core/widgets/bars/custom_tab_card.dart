import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/custom_ink_well.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class CustomTabCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final GestureTapCallback? onTap;

  const CustomTabCard(
      {Key? key, required this.isSelected, this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        width: 0.22.sw,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: isSelected
                      ? AppColors.iconColorV1
                      : AppColors.iconColorV1.withOpacity(0.2),
                  width: isSelected ? 2.w : 1.w,
                )),
          ),
          child: BaseText(
            title: title,
            size: 14.sp,
            color:isSelected
            ? AppColors.iconColorV1
            : AppColors.thirdMainColor.withOpacity(0.6),
            fontWeight: FontWeight.w400,
            maxLines: 1,
          )),
    );
  }
}
