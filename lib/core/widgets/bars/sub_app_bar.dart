import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../button/custom_ink_well.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class SubAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double? textSize;
  final FontWeight? fontWeight;
  final VoidCallback? arrowBackFunc;
  final GestureTapCallback? onTap;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const SubAppBar(
      {Key? key,
      this.fontWeight,
      this.textSize,
      required this.title,
      this.arrowBackFunc,
      this.onTap,
      this.bottom,
      this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<SubAppBar> createState() => _SubAppBarState();
}

class _SubAppBarState extends State<SubAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom:widget.bottom ,
      title: CustomInkWell(
        onTap: widget.onTap,
        child: Text(widget.title??"",style: Theme.of(context).textTheme.bodyMedium!),
      ),
      titleSpacing: 0,
      actions: widget.actions,
      // centerTitle: true,
      leading: IconButton(
        onPressed: widget.arrowBackFunc ??
            () {
              Get.back();
            },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 25.r,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
    );
  }
}
