import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../style/color.dart';

class AnimatedDialog extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? content;
  final Curve? curve;
  final Color? backgroundColor;

  const AnimatedDialog(
      {Key? key, this.height, this.width, this.content, this.curve,this.backgroundColor})
      : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(
        parent: controller, curve: widget.curve ?? Curves.decelerate);
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: SizedBox(
        width: widget.width ?? 300.w,
        height: widget.height,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: Colors.white,
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: widget.width ?? 300.w,
            height: widget.height,
            color:widget.backgroundColor??AppColors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: widget.content,
          ),
        ),
      ),
    );
  }
}

Future getAnimatedDialog<T>(
    {double? height, double? width, Widget? content, Curve? curve,Color?backgroundColor}) async {
  return await Get.dialog<T>(AnimatedDialog(

    height: height,
    width: width,
    content: content,
    curve: curve,
    backgroundColor: backgroundColor,
  ));
}
