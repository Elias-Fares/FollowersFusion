
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import 'controllers/login_controller.dart';
import 'forgot_password_page.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'welcome_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "/welcome-screen";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomePage(goToLoginFunc: () {
        _controller.setIsFirstOpen(value: true);
        Get.offAndToNamed(LoginScreen.routeName);
      }, goToSignUpFunc: () {
        _controller.setIsFirstOpen(value: true);
        Get.offAndToNamed(SignUpScreen.routeName);
      }),
    );
  }
}
