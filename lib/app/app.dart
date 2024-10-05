import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followers/screen/auth/sign_up_page.dart';

import 'package:get/get.dart';

import '../core/constant.dart';

import '../core/routs.dart';

import '../screen/auth/forgot_password_screen.dart';
import '../screen/auth/reset_password_screen.dart';
import '../screen/auth/sign_up_screen.dart';
import '../screen/auth/splash_screen.dart';
import '../screen/home_screen/home.dart';
import '../screen/requset_services_screen/requset_services.dart';
import '../utlis/bindings/main_binding.dart';
import '../utlis/translation/translation.dart';
import 'controller/ThemeController.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),

      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<ThemeController>(

          init: ThemeController(),
            builder: (theme){
             return  GetMaterialApp(
                locale: AppLanguageKeys.appLang.value == AR
                    ? const Locale('ar', '')
                    : const Locale('en', ''),
                debugShowCheckedModeBanner: false,
                initialBinding: MainBinding(),
                translations: Translation(),
                initialRoute: RequestServicesScreen.routeName,
                theme: Get.find<ThemeController>().currentTheme,
                darkTheme: Get.find<ThemeController>().darkTheme,
                //themeMode: ThemeMode.system,
                // change it when you enable theming in app //
                themeMode: ThemeMode.light,

                getPages: Routs.getPages,
              );
            }

        );
          
          
          

      },
    );
  }
}
