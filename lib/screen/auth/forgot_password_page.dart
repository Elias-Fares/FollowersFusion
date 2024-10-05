import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/widgets/button/buttons/loading_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';
import 'widgets/auth_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController? emailTextEditingController;
  final FormFieldValidator<String>? emailValidator;
  final VoidCallback forgotPasswordFunc;

  const ForgotPasswordPage(
      {Key? key,
      this.emailValidator,
      required this.forgotPasswordFunc,
      this.emailTextEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GeneralImageAssets(
                path: Res.lockImg,
                width: 200,
                height: 200,
                boxFit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(height: 70.h),
          BaseText(
              title: LocalKeys.can_not_remember_password.tr,

              textStyle: Theme.of(context).textTheme.headlineMedium!
                  .copyWith(color: Theme.of(context).secondaryHeaderColor)),
          SizedBox(height: 20.h),
          BaseText(
            title: LocalKeys.no_worries.tr,
            textStyle: Theme.of(context).textTheme.displaySmall,

          ),
          SizedBox(height: 20.h),
          BaseText(
              title: LocalKeys.please_enter_email_associated_account.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium,

          ),
          SizedBox(height: 45.h),
          BaseText(

              title: LocalKeys.email.tr,
              textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

          ),
          CustomTextFormField(
              borderStyleType: BorderStyleType.outlineInput,
              hintText: LocalKeys.email.tr,
              controller: emailTextEditingController,
              validator: emailValidator),
          SizedBox(height: 30.h),
          LoadingButton(
            onPressed: forgotPasswordFunc,
           elevation: 0,
            height: 57.h,
            child: BaseText(
                title: LocalKeys.submit.tr,
              textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.white),

            ),
          ),
          SizedBox(height: 55.h),
        ],
      ),
    );
  }
}
