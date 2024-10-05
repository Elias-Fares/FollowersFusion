
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res.dart';
import '../../../utlis/translation/local_keys.dart';
import '../button/custom_ink_well.dart';
import '../images/general_image_assets.dart';
import '../style/color.dart';
import '../text/custom_text_from_field.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onFilterPress;
  const SearchAppBar({Key? key,required this.onFilterPress})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  final Size preferredSize;
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomInkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 25.r,
                      color: AppColors.white
                    ),
                  ),
                  CustomTextFormField(
                    width: 300.w,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                    ),
                    borderStyleType: BorderStyleType.outlineInput,
                    borderEnabledWidth: 0,
                    fillColor: AppColors.black.withOpacity(.2),
                    margin: EdgeInsets.zero,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    borderEnabledColor: AppColors.transparent,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    prefixIcon: GeneralImageAssets(
                        path: Res.searchIcon, height: 24.r, width: 24.r),
                  ),
                  CustomInkWell(
                    onTap: widget.onFilterPress,
                    child: GeneralImageAssets(
                        path: Res.filteredIcon, height: 24.r, width: 24.r),
                  )
                ]),

          ],
        ),
      ),
    );
  }
}
