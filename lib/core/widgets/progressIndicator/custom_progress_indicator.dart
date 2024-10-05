import 'package:flutter/material.dart';

import '../style/color.dart';


class CustomProgressIndicator extends StatelessWidget {

  final bool isLoading;

  const CustomProgressIndicator({Key? key, required this.isLoading}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
        : Container();
  }
}