import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class ProfileImageErrorWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const ProfileImageErrorWidget({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.account_circle,
      color: color?? AppColors.fourthMainColor,
      size: size?? 50.r,
    );
  }
}
