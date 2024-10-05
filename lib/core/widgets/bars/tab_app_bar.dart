import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../button/custom_ink_well.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class TabAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? arrowBackFunc;
  final GestureTapCallback? onTap;
  final Widget? flexibleSpace;

  const TabAppBar(
      {Key? key,
      required this.title,
      this.arrowBackFunc,
      this.onTap,
      this.flexibleSpace})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<TabAppBar> createState() => _TabAppBarState();
}

class _TabAppBarState extends State<TabAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: CustomInkWell(
        onTap: widget.onTap,
        child: BaseText(
          title: widget.title,
          size: 14.sp,
          color: AppColors.thirdMainColor,
        ),
      ),
      titleSpacing: 0,
      // centerTitle: true,
      leading: IconButton(
        onPressed: widget.arrowBackFunc ??
            () {
              Get.back();
            },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 25.r,
          color: AppColors.thirdMainColor,
        ),
      ),
      flexibleSpace: widget.flexibleSpace,
    );
  }
}
