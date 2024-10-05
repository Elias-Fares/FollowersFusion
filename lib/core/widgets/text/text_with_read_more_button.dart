import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import '../button/custom_text_button.dart';
import '../style/color.dart';
import 'base_text.dart';

class AnimatedReadMoreText extends StatefulWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  final Clip clipBehavior;
  final Axis direction;
  final String? text;
  final double? textSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? textWeight;
  final double? textHeight;
  final String? textFontFamily;
  final int? maxLinesBeforeExpanded;
  final TextOverflow overflow;
  final Color readMoreColor;
  final Color readLessColor;
  final String titleReadMore;
  final String titleShowLess;
  final VoidCallback? onPressedReadMore;
  final double? fontSizeReadMore;
  final String? fontFamilyReadMore;
  final FontWeight? fontWeightReadMore;
  final EdgeInsets? paddingReadMore;
  final Duration duration;
  final bool enableLoadMorePress;

  const AnimatedReadMoreText({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
    this.direction = Axis.vertical,
    this.text,
    this.textSize,
    this.textColor,
    this.textAlign,
    this.textWeight,
    this.textHeight,
    this.textFontFamily,
    this.maxLinesBeforeExpanded = 3,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration,
    this.readMoreColor = AppColors.secondMainColor,
    this.titleReadMore = LocalKeys.read_more,
    this.onPressedReadMore,
    this.fontSizeReadMore,
    this.fontFamilyReadMore,
    this.fontWeightReadMore,
    this.paddingReadMore,
    this.enableLoadMorePress=true,
    this.titleShowLess = LocalKeys.show_less,
    this.duration = const Duration(milliseconds: 500),
    this.readLessColor = AppColors.secondMainColor,
  }) : super(key: key);

  @override
  State<AnimatedReadMoreText> createState() => _AnimatedReadMoreTextState();
}

class _AnimatedReadMoreTextState extends State<AnimatedReadMoreText> {
  final RxBool showMore = false.obs;

  void toggleShowMore() {
    showMore.value = !showMore.value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: widget.crossAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        mainAxisAlignment: widget.mainAxisAlignment,
        textDirection: widget.textDirection,
        textBaseline: widget.textBaseline,
        verticalDirection: widget.verticalDirection,
        children: [
          AnimatedSize(
            duration: widget.duration,
            child: BaseText(
                title: widget.text,
                color: widget.textColor,
                fontWeight: widget.textWeight,
                size: widget.textSize,
                height: widget.textHeight,
                decoration: widget.textDecoration,
                maxLines: showMore.value ? 10000000 : widget.maxLinesBeforeExpanded,
                overflow: widget.overflow,
                fontFamily: widget.textFontFamily,
                textAlign: widget.textAlign),
          ),
          SizedBox(height: 5.h),
          if(widget.text!=null &&widget.text!.length>49 )...[
            CustomTextButton(
              onPressed: () {
                if (widget.onPressedReadMore != null) {
                  widget.onPressedReadMore!();
                }
                if(widget.enableLoadMorePress){
                  toggleShowMore();
                }

              },
              title:
              showMore.value ? widget.titleShowLess.tr : widget.titleReadMore.tr,
              fontSize: widget.fontSizeReadMore ?? 16.sp,
              fontWeight: widget.fontWeightReadMore ?? FontWeight.w400,
              fontFamily: widget.fontFamilyReadMore,
              color: showMore.value ? widget.readLessColor : widget.readMoreColor,
              padding: widget.paddingReadMore,
            )
          ]

        ],
      );
    });
  }
}

