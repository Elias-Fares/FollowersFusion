import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import 'forgot_password_page.dart';
import 'reset_password_page.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/reset-password-screen";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc021934),
      appBar: SubAppBar(
        title: LocalKeys.reset_password.tr,
      ),
      body: ResetPasswordPage(resetPasswordFunc: () {}),
    );
  }
}
