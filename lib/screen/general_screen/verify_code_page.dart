
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/button/buttons/loading_button.dart';
import '../../../../core/widgets/button/custom_text_button.dart';
import '../../../../core/widgets/style/color.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../res.dart';
import '../../../../utlis/translation/local_keys.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/text/custom_text_from_field.dart';


class VerifyCodePage extends StatelessWidget {
  final TextEditingController verifyCodeTextEditingController;
  final FormFieldValidator<String>? verifyCodeValidator;
  final VoidCallback verifyCodePress;
  final VoidCallback resendCodePress;
  final String imgPath;
  final String title;
  final String description;

  const VerifyCodePage(
      {Key? key,

       required this.imgPath,
      required this.title,
      required this.description,
      required this.verifyCodeValidator,
      required this.verifyCodePress,
      required this.verifyCodeTextEditingController,
      required this.resendCodePress})
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
            path: imgPath,
            width: 190.r,
            height: 190.r,
          ),
          SizedBox(height: 70.h),
          BaseText(
              title:title,
              textAlign: TextAlign.center,
              textStyle: Theme.of(context).textTheme.displayMedium!
                  .copyWith(color: Theme.of(context).primaryColor)),

          SizedBox(height: 20.h),
          BaseText(
              title: description,
              textAlign: TextAlign.center,
              size: 16.sp,
              textStyle: Theme.of(context).textTheme.bodyMedium

          ),
          SizedBox(height: 60.h),
          CustomTextFormField(
              borderStyleType: BorderStyleType.outlineInput,
              hintText: "${LocalKeys.code.tr}...",
              controller: verifyCodeTextEditingController,
              validator: verifyCodeValidator),
          SizedBox(height: 30.h),
          BaseText(
              title: LocalKeys.did_not_receive_code.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color: Theme.of(context).hintColor,),
              textAlign: TextAlign.center,


          ),
          SizedBox(height: 20.h),
          CustomTextButton(
              title: LocalKeys.resend_it.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
              padding: EdgeInsets.zero,
              onPressed: resendCodePress),
          SizedBox(height: 60.h),
          LoadingButton(
            onPressed: verifyCodePress,
            borderRadius: 5.r,
            color: AppColors.mainColor,
            height: 57.h,
            child: BaseText(
                title: LocalKeys.verify.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
