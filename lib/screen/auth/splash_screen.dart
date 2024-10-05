
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/images/general_image_assets.dart';
import '../../res.dart';

import 'controllers/login_controller.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final LoginController _controller = Get.find();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
            () {
              _controller.initSettings();
            });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Stack(
              fit: StackFit.expand,
              children: [



                Positioned.fill(
                  child: GeneralImageAssets(
                      path: Res.bgImg, boxFit: BoxFit.fill),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: GeneralImageAssets(
                        path: Res.followers_logo, boxFit: BoxFit.contain,
                    height: 166,width: 166,),
                  ),
                ),
              ],
            )));
  }
}
