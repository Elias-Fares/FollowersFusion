import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import '../../../screens/auth/login_screen.dart';
import '../../../utlis/translation/local_keys.dart';
import '../../constant.dart';
import '../button/buttons/loading_button.dart';
import '../style/color.dart';
import '../text/base_text.dart';
import 'animated_dialog.dart';

class AuthDialog extends StatelessWidget {

  final bool needBackScreen;

  const AuthDialog({Key? key, this.needBackScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error_outline,
          size: 100.r,
          color: AppColors.checkFalseColor,
        ),
        SizedBox(height: 25.h),
        Flexible(
            child: BaseText(
                title: LocalKeys.you_need_login.tr)),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: LoadingButton(
                height: 45.h,
                color: AppColors.fifthMainColor,
                child: BaseText(
                    size: 14.sp,
                    color: AppColors.white,
                    title: LocalKeys.cancel.tr),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: LoadingButton(
                height: 45.h,
                child: BaseText(
                    size: 14.sp,
                    color: AppColors.white,
                    title: LocalKeys.login.tr),
                onPressed: () {
                  Get.back();
                  // Get.to(LoginScreen(needBackScreen: needBackScreen,));
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

void needAuthFunc({bool needBackScreen = false}) {
  getAnimatedDialog(
      content:  AuthDialog(needBackScreen: needBackScreen),
      curve: Curves.elasticInOut);
}

void checkNeedAuth({VoidCallback? voidCallback, bool needBackScreen = false}){
  if (LocalStaticVar.token.isEmpty) {
    needAuthFunc(needBackScreen: needBackScreen);
  }  else{
    if (voidCallback!=null) voidCallback();
  }
}