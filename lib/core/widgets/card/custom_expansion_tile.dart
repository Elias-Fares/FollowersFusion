import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res.dart';
import '../images/general_image_assets.dart';
import '../list_views/custom_divider_separator.dart';
import '../style/color.dart';
import '../style/custom_shimmer.dart';
import '../text/base_text.dart';

class CustomExpansionTile extends StatefulWidget {
  final String iconPath;
  final String title;
  final EdgeInsetsGeometry? childrenPadding;
  final List<Widget> children;

  const CustomExpansionTile(
      {Key? key,
      this.iconPath = Res.arrowDownIcon,
      required this.title,  this.children = const <Widget>[], this.childrenPadding,})
      : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: widget.childrenPadding??EdgeInsets.zero,
            initiallyExpanded: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                    title: widget.title,
                    fontWeight: FontWeight.w700,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!,
                    size: 13.sp),
                CustomDividerSeparator(
                  padding: EdgeInsets.only(top: 5.h),
                  color: AppColors.hintTextColor.withOpacity(.5),
                )
              ],
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            //shape: Border(bottom: BorderSide(color:  AppColors.hintTextColor.withOpacity(.5))),
            onExpansionChanged: ((value) => setState(() {
                  value ? _controller.forward() : _controller.reverse();
                })),
            trailing: RotationTransition(
              turns: _iconTurns,
              child: GeneralImageAssets(
                  path: widget.iconPath, height: 12.r, width: 12.r),
            ),
            children: widget.children,
          ),
        ),
      ],
    );
  }
}

class CustomExpansionTileLoadingCard extends StatelessWidget {
  const CustomExpansionTileLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(height: 5.h,),
        Divider(color: AppColors.iconColorV1.withOpacity(0.3)),
        CustomShimmer(
          child: Container(
              height: 45.h,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.shimmerColor,
              )),
        )
      ],
    );
  }
}
