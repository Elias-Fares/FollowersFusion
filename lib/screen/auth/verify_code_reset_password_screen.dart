import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../../res.dart';
import '../general_screen/verify_code_page.dart';
import 'reset_password_screen.dart';


class VerifyCodeResetPasswordScreen extends StatefulWidget {
  static const routeName = "/verify-code-reset-password-screen";

  const VerifyCodeResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeResetPasswordScreen> createState() => _VerifyCodeResetPasswordScreenState();
}

class _VerifyCodeResetPasswordScreenState extends State<VerifyCodeResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
    return Scaffold(
      appBar: SubAppBar(title: LocalKeys.verify_code.tr,),
      body: VerifyCodePage(
        imgPath: Res.resetPasswordImg,
          title: LocalKeys.verification_code.tr,
          description:  LocalKeys.verify_code_dcs_for_reset_password.tr,
        verifyCodeValidator: (String? value) {  },
        verifyCodeTextEditingController: textEditingController,
        verifyCodePress: () {
        Get.toNamed(ResetPasswordScreen.routeName);
      },
        resendCodePress: () {},

      ),
    );
  }
}
