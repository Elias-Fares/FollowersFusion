
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

class VerifyCodeResetPasswordPage extends StatelessWidget {
  final TextEditingController? verifyCodeTextEditingController;
  final FormFieldValidator<String>? verifyCodeValidator;
  final VoidCallback verifyCodeFunc;
  final VoidCallback resendCodeFunc;

  const VerifyCodeResetPasswordPage(
      {Key? key,
      this.verifyCodeValidator,
      required this.verifyCodeFunc,
      this.verifyCodeTextEditingController,
      required this.resendCodeFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          GeneralImageAssets(
            path: Res.resetPasswordImg,
            width: 190.r,
            height: 190.r,
          ),
          SizedBox(height: 70.h),
          BaseText(
              title: LocalKeys.verification_code.tr,
              size: 32.sp,
              color: AppColors.mainColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400),
          SizedBox(height: 20.h),
          BaseText(
              title: LocalKeys.verify_code_dcs_for_reset_password.tr,
              size: 16.sp,
              color: AppColors.textColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400),
          SizedBox(height: 60.h),
          AuthTextField(
              hintText: "${LocalKeys.code.tr}...",
              controller: verifyCodeTextEditingController,
              validator: verifyCodeValidator),
          SizedBox(height: 30.h),
          BaseText(
              title: LocalKeys.did_not_receive_code.tr,
              size: 16.sp,
              color: AppColors.hintTextColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400),
          SizedBox(height: 20.h),
          CustomTextButton(
              title: LocalKeys.resend_it.tr,
              color: AppColors.textColor,
              fontSize: 16.sp,
              padding: EdgeInsets.zero,
              fontWeight: FontWeight.w700,
              onPressed: resendCodeFunc),
          SizedBox(height: 60.h),
          LoadingButton(
            onPressed: verifyCodeFunc,
            borderRadius: 5.r,
            color: AppColors.mainColor,
            height: 57.h,
            child: BaseText(
                title: LocalKeys.verify.tr,
                color: AppColors.white,
                size: 20.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
