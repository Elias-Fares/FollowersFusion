import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';
import '../text/base_text.dart';
import 'custom_ink_well.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final T value;
  final T selectedValue;
  final GestureTapCallback? onSelect;
  final double? iconSize;
  final Color? iconActiveColor;
  final Color? iconBorderColor;
  final String? title;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? textHeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spaceBetween;

  const CustomRadioButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.onSelect,
    this.title,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.decoration,
    this.fontWeight,
    this.textHeight,
    this.fontFamily,
    this.maxLines,
    this.overflow,
    this.iconSize,
    this.iconActiveColor,
    this.iconBorderColor, this.spaceBetween,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late bool selected;

  @override
  void initState() {
    selected = widget.value == widget.selectedValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomRadioButton oldWidget) {
    selected = widget.value == widget.selectedValue;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // selected = widget.value == widget.selectedValue;
    return CustomInkWell(
      onTap: widget.onSelect,
      borderRadius: BorderRadius.circular(4.r),
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        children: [
          Container(
            height: widget.iconSize ?? 16.r,
            width: widget.iconSize ?? 16.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: selected
                      ? widget.iconActiveColor ?? AppColors.primaryColor
                      : widget.iconBorderColor ?? AppColors.borderColor,
                  width: 1.r),
            ),
            padding: EdgeInsets.all(3.r),
            child: Container(
                decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected
                  ? widget.iconActiveColor ?? AppColors.primaryColor
                  : AppColors.transparent,
            )),
          ),
          if (widget.title != null) ...[
             SizedBox(width: widget.spaceBetween??8.w),
            BaseText(
                title: widget.title ?? "",
                size: widget.fontSize ?? 13.sp,
                maxLines: widget.maxLines ?? 1,
                color: widget.textColor,
                decoration: widget.decoration,
                fontFamily: widget.fontFamily,
                fontWeight: widget.fontWeight,
                height: widget.textHeight,
                overflow: widget.overflow??TextOverflow.ellipsis,
                textAlign: widget.textAlign,
                key: widget.key),
          ],
        ],
      ),
    );
  }
}
