import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/payment_methods_widget/payment_methods_widget.dart';
import '../../core/widgets/button/buttons/loading_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';
import 'controllers/login_controller.dart';
import 'widgets/auth_text_field.dart';

class LoginPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final VoidCallback loginFunc;
  final VoidCallback forgotPasswordFunc;
  final VoidCallback creatAccountFunc;
  final List<Widget> socialChildren;
  final Axis socialChildrenDirection;
  final MainAxisAlignment socialChildrenMinAxisAlignment;
  final MainAxisSize socialChildrenMainAxisSize;
  final CrossAxisAlignment socialChildrenCrossAxisAlignment;
  final bool isLoading;
  final LoginController controller;
  final GlobalKey<FormState> formKey;

  const LoginPage({
    Key? key,
    this.emailValidator,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.loginFunc,
    required this.forgotPasswordFunc,
    required this.creatAccountFunc,
    required this.isLoading,
    required this.controller,
    required this.formKey,
    this.socialChildren = const <Widget>[],
    this.socialChildrenDirection = Axis.horizontal,
    this.socialChildrenMinAxisAlignment = MainAxisAlignment.center,
    this.socialChildrenMainAxisSize = MainAxisSize.max,
    this.socialChildrenCrossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),

              const GeneralImageAssets(
                path: Res.followers_logo, boxFit: BoxFit.contain,
                height: 100,width: 100,),
              Row(
                children: [
                  BaseText(

                      title: LocalKeys.welcome.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)

                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(

                children: [
                  Expanded(
                    child: BaseText(
                        title: LocalKeys.login_here.tr,

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

                      title: LocalKeys.email.tr,
                      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).secondaryHeaderColor)

                  ),
                ],
              ),
              CustomTextFormField(
                borderStyleType: BorderStyleType.outlineInput,
                  hintText: LocalKeys.email.tr,
                  keyboardType: TextInputType.emailAddress,
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
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextButton(
                      title: '${LocalKeys.forgot_password.tr}?',
                      textStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: Theme.of(context).colorScheme.tertiary),
                      padding: EdgeInsets.zero,
                      onPressed: forgotPasswordFunc)
                ],
              ),
              SizedBox(height: 30.h),
              LoadingButton(
                loading: isLoading,
                onPressed: loginFunc,
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
                      color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700),

              ),
              SizedBox(height: 20.h),
              Flex(
                direction: socialChildrenDirection,
                mainAxisAlignment: socialChildrenMinAxisAlignment,
                mainAxisSize: socialChildrenMainAxisSize,
                crossAxisAlignment: socialChildrenCrossAxisAlignment,
                children: socialChildren
              ),

              // PaymentMethodsWidget(
              //   onResponse: (paymentResponse) {
              //     log("the payment ="+paymentResponse.toJson().toString());
              //   }, price: '500',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
