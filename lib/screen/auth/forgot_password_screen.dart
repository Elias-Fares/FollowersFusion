import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/bars/sub_app_bar.dart';
import '../../utlis/translation/local_keys.dart';
import 'forgot_password_page.dart';
import 'verify_code_reset_password_screen.dart';


class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/forgot-password-screen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc021934),
      appBar: SubAppBar(title: LocalKeys.forgot_password.tr,),
      body: ForgotPasswordPage(forgotPasswordFunc: () {
        Get.toNamed(VerifyCodeResetPasswordScreen.routeName);
      }),
    );
  }
}
