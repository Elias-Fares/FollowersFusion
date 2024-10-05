import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/widgets/button/buttons/loading_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';
import 'widgets/auth_text_field.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback goToLoginFunc;
  final VoidCallback goToSignUpFunc;

  const WelcomePage(
      {Key? key, required this.goToLoginFunc, required this.goToSignUpFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            GeneralImageAssets(
              path: Res.welcomeImg,
              width: 384.w,
              height: 348.h,
            ),
            SizedBox(height: 84.h),
            BaseText(
                title: LocalKeys.welcome_screen_title.tr,
                textStyle: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 20.h),
            BaseText(
                title: LocalKeys.welcome_screen_dcs.tr,
                textStyle: Theme.of(context).
                textTheme.bodyMedium!.copyWith(color:Theme.of(context).hintColor ),
            ),
            SizedBox(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoadingButton(
                  onPressed: goToLoginFunc,
                  borderRadius: 5.r,
                  color: AppColors.mainColor,
                  height: 57.h,
                  width: 152.w,
                  child: BaseText(
                      title: LocalKeys.login.tr,
                      textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.white),

                  ),
                ),

                LoadingButton(
                  onPressed: goToLoginFunc,
                  borderRadius: 5.r,
                  color: AppColors.white,
                  borderColor: AppColors.hintTextColor,
                  height: 57.h,
                  width: 152.w,
                  child: BaseText(
                      title: LocalKeys.register.tr,
                    textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700),

                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
