import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../core/functions/validtion.dart';
import '../../core/widgets/button/custom_ink_well.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../res.dart';
import 'controllers/login_controller.dart';
import 'forgot_password_screen.dart';
import 'login_page.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login-screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController loginController=Get.find();
   final TextEditingController? emailTextEditingController =TextEditingController();
  final TextEditingController? passwordTextEditingController=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc021934),

      body: Obx((){
        return LoginPage(
          emailTextEditingController: emailTextEditingController,
          passwordTextEditingController: passwordTextEditingController,
          controller: loginController,
          isLoading: loginController.isLoading.value,
           formKey: _formKey,
           emailValidator:(val){
           return Validator.emailValid(value: val);
           },
          passwordValidator:(val){
           return Validator.emptyText(value: val);
           },
          loginFunc: () {

            if (!(_formKey.currentState?.validate() ?? false)) {
              return;
            }
            loginController.loginRQ(
                userName: emailTextEditingController?.text??"",
                password: passwordTextEditingController?.text??"");

          //  Get.offAndToNamed(MainScreen.routeName);
          },

          creatAccountFunc: () {
            Get.toNamed(SignUpScreen.routeName);
          },
          forgotPasswordFunc: () {
            Get.toNamed(ForgotPasswordScreen.routeName);
          },
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
      }
      )
    );
  }
}
