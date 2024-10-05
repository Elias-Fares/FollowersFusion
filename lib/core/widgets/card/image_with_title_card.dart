import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/custom_ink_well.dart';
import '../images/general_image_assets.dart';
import '../images/general_network_image.dart';
import '../text/base_text.dart';
import 'loading_card.dart';

class ImageWithTitleCard extends StatelessWidget {
  final bool isLoading;
  final String imageUrl;
  final String title;
  final bool fromLocal;
  final BoxShape imageShape;
  final Clip clipImage;
  final double? heightImage;
  final double? widthImage;
  final double? fontSize;
  final Color? fontColor;
  final Color? imageColor;
  final TextAlign? textAlign;
  final TextDecoration? fontDecoration;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Size? spaceBetween;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final double? loadingCardTextHeight;
  final double? loadingCardTextWidth;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? titleBorderRadius;
  final BorderRadiusGeometry? imageBorderRadius;
  final Widget? shimmerChild;
  final Axis direction;
  final Function()? onPress;

  const ImageWithTitleCard(
      {Key? key,
      this.isLoading = false,
      required this.imageUrl,
      required this.title,
      this.fromLocal = false,
      this.imageShape = BoxShape.rectangle,
      this.clipImage = Clip.antiAlias,
      this.heightImage,
      this.widthImage,
      this.fontSize,
      this.fontColor,
      this.textAlign,
      this.fontDecoration,
      this.fontWeight,
      this.fontHeight,
      this.fontFamily,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.spaceBetween,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.max,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.loadingCardTextHeight,
      this.loadingCardTextWidth,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.shimmerChild,
      this.titleBorderRadius,
      this.imageBorderRadius,
      this.imageColor,
      this.direction = Axis.horizontal,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ImageWithTitleLoadingCard(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          imageShape: imageShape,
          maxLines: maxLines,
          baseShimmerColor: baseShimmerColor,
          cardColor: cardColor,
          highlightShimmerColor: highlightShimmerColor,
          heightImage: heightImage,
          widthImage: widthImage,
          imageBorderRadius: imageBorderRadius,
          titleBorderRadius: titleBorderRadius,
          loadingCardTextHeight: loadingCardTextHeight,
          loadingCardTextWidth: loadingCardTextWidth,
          shimmerChild: shimmerChild,
          direction: direction,
          spaceBetween: spaceBetween);
    }

    return CustomInkWell(
      onTap: onPress,
      child: Flex(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        direction: direction,
        children: [
          Container(
            decoration: BoxDecoration(shape: imageShape),
            clipBehavior: clipImage,
            height: heightImage ?? 28.r,
            width: widthImage ?? 28.r,
            child: fromLocal
                ? GeneralImageAssets(
                    path: imageUrl,
                    height: heightImage ?? 28.r,
                    width: widthImage ?? 28.r,
                    color: imageColor,
                    boxFit: BoxFit.fill)
                : GeneralNetworkImage(
                    url: imageUrl,
                    height: heightImage ?? 28.r,
                    color: imageColor,
                    width: widthImage ?? 28.r,
                    boxFit: BoxFit.fill),
          ),
          SizedBox(
              height: spaceBetween != null ? spaceBetween!.height : 0,
              width: spaceBetween != null ? spaceBetween!.width : 10.w),
          BaseText(
              title: title,
              size: fontSize ?? 12.sp,
              height: fontHeight,
              decoration: fontDecoration,
              textAlign: textAlign,
              color: fontColor,
              maxLines: maxLines,
              overflow: overflow,
              fontFamily: fontFamily,
              fontWeight: fontWeight ?? FontWeight.w500)
        ],
      ),
    );
  }
}

class ImageWithTitleLoadingCard extends StatelessWidget {
  final BoxShape imageShape;
  final double? heightImage;
  final double? widthImage;
  final Size? spaceBetween;
  final int? maxLines;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final double? loadingCardTextHeight;
  final double? loadingCardTextWidth;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? titleBorderRadius;
  final BorderRadiusGeometry? imageBorderRadius;
  final Axis direction;
  final Widget? shimmerChild;

  const ImageWithTitleLoadingCard(
      {Key? key,
      this.imageShape = BoxShape.rectangle,
      this.heightImage,
      this.widthImage,
      this.spaceBetween,
      this.maxLines,
      required this.mainAxisAlignment,
      required this.mainAxisSize,
      required this.crossAxisAlignment,
      this.loadingCardTextHeight,
      this.loadingCardTextWidth,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.titleBorderRadius,
      this.shimmerChild,
      this.imageBorderRadius,
      this.direction = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      children: [
        LoadingCard(
            height: heightImage ?? 28.r,
            width: widthImage ?? 28.r,
            cardColor: cardColor,
            shape: imageShape,
            borderRadius: imageBorderRadius,
            highlightShimmerColor: highlightShimmerColor,
            baseShimmerColor: baseShimmerColor,
            child: shimmerChild),
        SizedBox(
            height: spaceBetween != null ? spaceBetween!.height : 0,
            width: spaceBetween != null ? spaceBetween!.width : 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              maxLines ?? 1,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: LoadingCard(
                        height: loadingCardTextHeight ?? 20.r,
                        width: loadingCardTextWidth ?? 100.r,
                        cardColor: cardColor,
                        borderRadius: titleBorderRadius,
                        highlightShimmerColor: highlightShimmerColor,
                        baseShimmerColor: baseShimmerColor,
                        child: shimmerChild),
                  )),
        )
      ],
    );
  }
}
