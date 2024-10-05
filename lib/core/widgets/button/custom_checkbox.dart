import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class CustomCheckbox extends StatefulWidget {
  final double? size;
  final double? iconSize;
  final ValueChanged<bool?>? onChange;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final bool? isChecked;

  const CustomCheckbox(
      {Key? key,
      this.size,
      this.iconSize,
      this.onChange,
      this.backgroundColor,
      this.iconColor,
      this.borderColor,
      this.icon,
      this.isChecked})
      : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          if (widget.onChange != null) {
            widget.onChange!(isChecked);
          }
        });
      },
      child: AnimatedContainer(
          height: widget.size ?? 16.r,
          width: widget.size ?? 16.r,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0.r),
              color: isChecked
                  ? widget.backgroundColor ?? AppColors.mainColor
                  : Colors.transparent,
              border:
                  Border.all(color: widget.borderColor ?? AppColors.mainColor)),
          child: isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? AppColors.white,
                  size: widget.iconSize ?? 12.r,
                )
              : null),
    );
  }
}
