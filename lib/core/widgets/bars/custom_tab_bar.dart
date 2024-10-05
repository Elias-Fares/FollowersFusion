import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utlis/translation/translation.dart';
import '../../constant.dart';
import '../style/color.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? controller;
  final ValueChanged<int>? onTap;
  final List<Widget> tabs;

  const CustomTabBar(
      {Key? key, this.controller, this.onTap, required this.tabs})
      : super(key: key);

  @override
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: false,
      controller: controller,
      indicatorColor: AppColors.transparent,
      labelColor: AppColors.mainColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0.00001,
      unselectedLabelColor: AppColors.lightGray,
      labelStyle: TextStyle(
          color: AppColors.mainColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
          color: AppColors.thirdMainColor,
          fontSize: 14.sp,
          fontFamily: LocalStaticVar.fontFamily,
          fontWeight: FontWeight.w600),
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      splashBorderRadius: BorderRadius.circular(8.r),
      enableFeedback: true,
      onTap: onTap,
      tabs: tabs,
    );
  }
}
