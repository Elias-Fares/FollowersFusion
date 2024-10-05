import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../card/loading_card.dart';
import 'base_text.dart';

class LoadingText extends StatelessWidget {
  final bool isLoading;
  final double? height;
  final double? width;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final BoxShape shape;
  final String? title;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? textHeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;

  const LoadingText(
      {Key? key,
      required this.isLoading,
      this.height,
      this.width,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.borderRadius,
      this.child,
      this.shape = BoxShape.rectangle,
      required this.title,
      this.size,
      this.color,
      this.textAlign,
      this.decoration,
      this.fontWeight,
      this.textHeight,
      this.fontFamily,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingCard(
          height: height??20.h,
          width: width??80.w,
          borderRadius: borderRadius,
          baseShimmerColor: baseShimmerColor,
          cardColor: cardColor,
          highlightShimmerColor: highlightShimmerColor,
          shape: shape,
          child: child);
    }
    return BaseText(
        title: title,
        height: textHeight,
        color: color,
        textAlign: textAlign,
        fontWeight: fontWeight,
        size: size,
        maxLines: maxLines,
        decoration: decoration,
        fontFamily: fontFamily,
        overflow: overflow);
  }
}
