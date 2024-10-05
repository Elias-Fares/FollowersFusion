import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../images/general_image_assets.dart';
import '../style/color.dart';
import '../text/base_text.dart';
import 'loading_card.dart';

class IconWithTitleCard extends StatelessWidget {
  final bool isLoading;
  final String path;
  final String title;
  final double? spaceBetween;
  final double? loadingCardHeight;
  final double? loadingCardWidth;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final Color? iconColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? shimmerChild;
  final BoxShape? loadingCardShape;
  final BoxFit boxFit;
  final double? iconHeight;
  final double? iconWidth;
  final double? textSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final double? textHeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;
  final TextStyle? textStyle;

  const IconWithTitleCard(
      {Key? key,
      required this.path,
      required this.title,
      this.isLoading = false,
      this.loadingCardHeight,
      this.loadingCardWidth,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.borderRadius,
      this.shimmerChild,
      this.loadingCardShape,
      this.iconColor,
      this.boxFit = BoxFit.fill,
      this.iconHeight,
      this.iconWidth,
      this.textSize,
      this.textColor,
      this.textAlign,
      this.textDecoration,
      this.fontWeight,
      this.textHeight,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.fontFamily,
      this.textStyle,
      this.spaceBetween})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingCard(
        height: loadingCardHeight ?? 20.r,
        width: loadingCardWidth ?? 100.r,
        cardColor: cardColor,
        borderRadius: borderRadius,
        shape: loadingCardShape ?? BoxShape.rectangle,
        highlightShimmerColor: highlightShimmerColor,
        baseShimmerColor: baseShimmerColor,
        child: shimmerChild,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GeneralImageAssets(
          path: path,
          height: iconHeight,
          width: iconWidth,
          color: iconColor,
          boxFit: boxFit,
        ),
        SizedBox(width: spaceBetween ?? 6.w),
        Flexible(
          child: BaseText(
              title: title,
              textStyle: textStyle,
              size: textSize ?? 12.sp,
              maxLines: maxLines ?? 1,
              textAlign: textAlign ?? TextAlign.center,
              color: textColor,
              height: textHeight,
              fontFamily: fontFamily,
              decoration: textDecoration,
              overflow: overflow,
              fontWeight: fontWeight ?? FontWeight.w400),
        )
      ],
    );
  }
}
