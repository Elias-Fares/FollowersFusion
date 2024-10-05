
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/functions/validtion.dart';
import '../../core/widgets/button/custom_ink_well.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../res.dart';
import 'controllers/register_controller.dart';
import 'login_screen.dart';
import 'sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign-up-screen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RegisterController registerController=Get.find();
  TextEditingController? emailTextEditingController;
  TextEditingController? fullNameTextEditingController;
  TextEditingController? confirmPasswordTextEditingController;
  TextEditingController? passwordTextEditingController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFc021934),
      body: Obx((){
        return SignUpPage(
          formKey: _formKey,
          isLoading: registerController.isLoading.value,
          registerController: registerController,
          emailValidator: (val)=>Validator.emailValid(value: val),
          fullNameValidator: (val)=>Validator.emptyText(value: val),
          passwordValidator: (val)=>Validator.matchPassword(
            value1: val??"",
            value2: confirmPasswordTextEditingController?.text??""
          ),
          confirmPasswordValidator: (val)=>Validator.matchPassword(
              value1: val??"",
              value2: passwordTextEditingController?.text??""
          ),
          signUpFunc: () {

            if (!(_formKey.currentState?.validate() ?? false)) {
              return;
            }
            registerController.registerRQ(
                userName: emailTextEditingController?.text??"",
                name: fullNameTextEditingController?.text??"",
                password: passwordTextEditingController?.text??"");
          },
          haveAccountFunc: () {Get.offAndToNamed(LoginScreen.routeName);},
          socialChildren: [
            CustomInkWell(
              onTap: () {},
              child: GeneralImageAssets(
                  path: Res.googleIcon, height: 30.r, width: 30.r),
            ),
            SizedBox(width: 30.w),
            CustomInkWell(
              onTap: () {},
              child: GeneralImageAssets(
                  path: Res.facebookIcon, height: 30.r, width: 30.r),
            ),
          ],
        );
      })
    );
  }
}
