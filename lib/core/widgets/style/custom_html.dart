import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../functions/random_func.dart';
import '../card/loading_card.dart';

class CustomHtml extends StatelessWidget {
  final bool isLoading;
  final int countLoadingCardRow;
  final Map<String, Style> style;
  final List<HtmlExtension> extensions;
  final Set<String>? onlyRenderTheseTags;
  final Set<String>? doNotRenderTheseTags;
  final bool shrinkWrap;
  final OnCssParseError? onCssParseError;
  final OnTap? onLinkTap;
  final OnTap? onAnchorTap;
  final String? data;
  final GlobalKey? anchorKey;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? shimmerChild;
  final BoxShape? loadingCardShape;

  const CustomHtml({
    Key? key,
    this.anchorKey,
    this.isLoading = false,
    this.countLoadingCardRow = 4,
    this.style = const {},
    this.extensions = const [],
    this.onlyRenderTheseTags,
    this.doNotRenderTheseTags,
    this.shrinkWrap = true,
    this.onCssParseError,
    this.onLinkTap,
    this.onAnchorTap,
    this.data,
    this.cardColor,
    this.baseShimmerColor,
    this.highlightShimmerColor,
    this.borderRadius,
    this.shimmerChild,
    this.loadingCardShape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              countLoadingCardRow,
              (index) => Builder(
                    builder: (context) {
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: LoadingCard(
                              height: 20.r,
                              width: 250.r -
                                  (RandomFunc.generateRandomNumber(10, 100).r),
                              cardColor: cardColor,
                              borderRadius: borderRadius,
                              shape: loadingCardShape ?? BoxShape.rectangle,
                              highlightShimmerColor: highlightShimmerColor,
                              baseShimmerColor: baseShimmerColor,
                              child: shimmerChild));
                    },
                  )));
    }
    return Html(
        key: key,
        anchorKey: anchorKey,
        shrinkWrap: shrinkWrap,
        data: data ?? '',
        doNotRenderTheseTags: doNotRenderTheseTags,
        extensions: extensions,
        onAnchorTap: onAnchorTap,
        onCssParseError: onCssParseError,
        onLinkTap: onLinkTap,

        onlyRenderTheseTags: onlyRenderTheseTags,
        style: style);
  }
}
