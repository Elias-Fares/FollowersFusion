import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../style/color.dart';

class BaseRichText extends StatelessWidget {

  final List<TextSpan> textSpanList;
  final String? text;
   String? fontFamily;
  final TextStyle? style;

   BaseRichText({Key? key,  this.fontFamily,
    required this.textSpanList, this.text, this.style})
      : super(key: key){
    fontFamily ??= LocalStaticVar.fontFamily;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
            text:text,
            style: style?? TextStyle(
                color: AppColors.thirdMainColor,
                fontSize: 24.sp,
                fontFamily:fontFamily,
                fontWeight: FontWeight.w600),
            children: textSpanList));
  }
}
