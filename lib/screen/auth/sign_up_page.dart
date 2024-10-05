import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/widgets/button/buttons/loading_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';
import 'controllers/register_controller.dart';
import 'widgets/auth_text_field.dart';

class SignUpPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? fullNameValidator;
  final FormFieldValidator<String>? passwordValidator;
    final FormFieldValidator<String>? confirmPasswordValidator;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? fullNameTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final TextEditingController? confirmPasswordTextEditingController;
  final VoidCallback signUpFunc;
  final VoidCallback haveAccountFunc;
  final List<Widget> socialChildren;
  final Axis socialChildrenDirection;
  final MainAxisAlignment socialChildrenMinAxisAlignment;
  final MainAxisSize socialChildrenMainAxisSize;
  final CrossAxisAlignment socialChildrenCrossAxisAlignment;
  final RegisterController registerController;
  final bool  isLoading;
  final GlobalKey<FormState> formKey;

  const SignUpPage({
    Key? key,
    this.emailValidator,
    required this.registerController,
    required this.isLoading,
    required this.formKey,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.signUpFunc,
    required this.haveAccountFunc,
    this.socialChildren = const <Widget>[],
    this.socialChildrenDirection = Axis.horizontal,
    this.socialChildrenMinAxisAlignment = MainAxisAlignment.center,
    this.socialChildrenMainAxisSize = MainAxisSize.max,
    this.socialChildrenCrossAxisAlignment = CrossAxisAlignment.center, this.fullNameValidator, this.confirmPasswordValidator, this.fullNameTextEditingController, this.confirmPasswordTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Form(
          key:formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),

              const GeneralImageAssets(
                path: Res.followers_logo, boxFit: BoxFit.contain,
                height: 100,width: 100,),
              SizedBox(height: 20.h),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.lets_get_you_started.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)

                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(

                children: [
                  Expanded(
                    child: BaseText(
                      title: LocalKeys.create_account.tr,

                      textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color:AppColors.textColor2
                      ),


                    ),
                  ),
                ],
              ),

              SizedBox(height: 68.h),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.full_name.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                  ),
                ],
              ),
              CustomTextFormField(
                  borderStyleType: BorderStyleType.outlineInput,
                  hintText: LocalKeys.full_name.tr,
                  controller: fullNameTextEditingController,
                  validator: fullNameValidator),

              SizedBox(height: 29.h),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.email.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                  ),
                ],
              ),
              CustomTextFormField(
                  borderStyleType: BorderStyleType.outlineInput,
                  hintText: LocalKeys.email.tr,
                  controller: emailTextEditingController,
                  validator: emailValidator),

              SizedBox(height: 29.h),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.password.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                  ),
                ],
              ),
              CustomTextFormField(
                  borderStyleType: BorderStyleType.outlineInput,
                  hintText: LocalKeys.password.tr,
                  controller: passwordTextEditingController,
                  obscureText: true,
                  validator: passwordValidator),
              SizedBox(height: 29.h),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.confirm_password.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                  ),
                ],
              ),
              CustomTextFormField(
                  borderStyleType: BorderStyleType.outlineInput,
                  hintText: LocalKeys.confirm_password.tr,
                  controller: confirmPasswordTextEditingController,
                  obscureText: true,
                  validator: confirmPasswordValidator),
              SizedBox(height: 30.h),
              LoadingButton(
                loading: isLoading,
                onPressed: signUpFunc,
               elevation: 0,
                height: 57.h,
                child: BaseText(
                    title: LocalKeys.get_started.tr,
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14, color: AppColors.white)
                ),
              ),
              SizedBox(height: 30.h),

              BaseText(
                  title: LocalKeys.or_continue_with.tr,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700, color: Theme.of(context).secondaryHeaderColor),

              ),
              SizedBox(height: 20.h),
              Flex(
                direction: socialChildrenDirection,
                mainAxisAlignment: socialChildrenMinAxisAlignment,
                mainAxisSize: socialChildrenMainAxisSize,
                crossAxisAlignment: socialChildrenCrossAxisAlignment,
                children: socialChildren
              ),
              SizedBox(height: 55.h),
            ],
          ),
        ),
      ),
    );
  }
}
