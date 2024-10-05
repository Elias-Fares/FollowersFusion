import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../core/widgets/style/color.dart';


class ThemeController extends GetxController {
  Rx<ThemeData> theme =AppColors.lightTheme.obs;

  ThemeData darkTheme=AppColors.darkTheme;

  void changeTheme(ThemeData newTheme) {
    theme.value = newTheme;
    update();
  }

  ThemeData get currentTheme => theme.value;

  bool isDarkTheme() => theme.value.brightness == Brightness.dark;
}
