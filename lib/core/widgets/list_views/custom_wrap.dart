import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../card/loading_card.dart';

class CustomWrap extends StatefulWidget {
  final bool isLoading;
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final Clip clipBehavior;
  final VerticalDirection verticalDirection;
  final List<Widget> children;
  final Widget? loadingChild;
  final int loadingChildCount;

  const CustomWrap({
    Key? key,
    this.isLoading = false,
    this.children = const <Widget>[],
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.loadingChild,
    this.loadingChildCount = 5,
  }) : super(key: key);

  @override
  State<CustomWrap> createState() => _CustomWrapState();

  static Builder builder({
    Key? key,
    required int itemCount,
    required IndexedWidgetBuilder builder,
    bool isLoading = false,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 10.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 10.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Widget? loadingChild,
    Clip clipBehavior = Clip.none,
    int loadingChildCount = 5,
  }) {
    return Builder(
      key: key,
      builder: (BuildContext context) {
        assert(itemCount >= 0, 'itemCount must be greater than or equal to 0');
        return CustomWrap(
          key: key,
          isLoading: isLoading,
          direction: direction,
          alignment: alignment,
          spacing: spacing,
          runAlignment: runAlignment,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          clipBehavior: clipBehavior,
          loadingChild: loadingChild,
          loadingChildCount: loadingChildCount,
          children:
              List.generate(itemCount, (index) => builder(context, index)),
        );
      },
    );
  }
}

class _CustomWrapState extends State<CustomWrap> {
  List<Widget> getLoadingChildren() {
    return List.generate(
        widget.loadingChildCount,
        (index) =>
            widget.loadingChild ??
            LoadingCard(
              height: 26.h,
              width: 75.w,
              borderRadius: BorderRadius.circular(6.r),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        crossAxisAlignment: widget.crossAxisAlignment,
        direction: widget.direction,
        alignment: widget.alignment,
        clipBehavior: widget.clipBehavior,
        runAlignment: widget.runAlignment,
        runSpacing: widget.runSpacing,
        spacing: widget.spacing,
        verticalDirection: widget.verticalDirection,
        textDirection: widget.textDirection,
        children: widget.isLoading ? getLoadingChildren() : widget.children);
  }
}
