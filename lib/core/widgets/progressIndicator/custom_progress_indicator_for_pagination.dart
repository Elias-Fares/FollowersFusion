import 'package:flutter/material.dart';

import '../style/color.dart';

class CustomProgressIndicatorForPagination extends StatelessWidget {
  const CustomProgressIndicatorForPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.mainColor,
    ));
  }
}
