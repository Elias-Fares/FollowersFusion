import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res.dart';
import '../images/general_image_assets.dart';
import '../style/color.dart';
import '../style/custom_shimmer.dart';
import '../text/base_text.dart';

class CustomDropDownButton extends StatefulWidget {
  final bool isLoading;
  final String iconPath;
  final String title;
  final List<Widget> children;
  final double? fontSize;
  final Color? titleColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final double? iconHeight;
  final double? iconWidth;
  final ShapeBorder? shape;
  final Widget? leading;
  final Widget? subtitle;
  final ShapeBorder? collapsedShape;
  final Color? collapsedBackgroundColor;
  final Color? collapsedIconColor;
  final Color? collapsedTextColor;
  final Color? backgroundColor;

  const CustomDropDownButton({
    Key? key,
    this.isLoading = false,
    required this.title,
    required this.children,
    this.fontSize,
    this.iconPath = Res.arrowDownIcon,
    this.titleColor,
    this.textAlign,
    this.textDecoration,
    this.fontWeight,
    this.fontHeight,
    this.fontFamily,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.tilePadding,
    this.childrenPadding,
    this.expandedCrossAxisAlignment,
    this.iconHeight,
    this.iconWidth,
    this.shape,
    this.leading,
    this.subtitle,
    this.collapsedShape,
    this.collapsedBackgroundColor,
    this.collapsedIconColor,
    this.collapsedTextColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const CustomDropDownButtonLoadingCard();
    }
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: widget.tilePadding ?? EdgeInsets.zero,
        shape: widget.shape,
        leading: widget.leading,
        subtitle: widget.subtitle,
        collapsedShape: widget.collapsedShape,
        collapsedBackgroundColor: widget.collapsedBackgroundColor,
        collapsedIconColor: widget.collapsedIconColor,
        collapsedTextColor: widget.collapsedTextColor,
        childrenPadding: widget.childrenPadding ?? EdgeInsets.zero,
        backgroundColor: widget.backgroundColor,
        title: BaseText(
            title: widget.title,
            fontWeight: widget.fontWeight ?? FontWeight.w500,
            size: widget.fontSize ?? 14.sp,
            color: widget.titleColor,
            fontFamily: widget.fontFamily,
            height: widget.fontHeight,
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            overflow: widget.overflow,
            decoration: widget.textDecoration),
        expandedCrossAxisAlignment:
            widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.start,
        onExpansionChanged: ((value) => setState(() {
              value ? _controller.forward() : _controller.reverse();
            })),
        trailing: RotationTransition(
          turns: _iconTurns,
          child: GeneralImageAssets(
              path: widget.iconPath,
              height: widget.iconHeight ?? 12.r,
              width: widget.iconWidth ?? 12.r),
        ),
        children: widget.children,
      ),
    );
  }
}

class CustomDropDownButtonLoadingCard extends StatelessWidget {
  const CustomDropDownButtonLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
          height: 45.h,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.shimmerColor,
          )),
    );
  }
}
