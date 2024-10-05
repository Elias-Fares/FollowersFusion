import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../card/loading_card.dart';
import 'general_network_image.dart';
import 'multiple_image_viewer.dart';

class SliderImage extends StatefulWidget {
  final List<String>? images;
  final int initialPage;
  final double? height;
  final double? width;
  final double viewportFraction;
  final Duration slideDuration;
  final Duration moveToNextPageDuration;
  final Curve curve;
  final bool isLoading;
  final Widget? loadingChild;
  final int loadingChildCount;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final PageController? controller;
  final Decoration? decoration;
  final Clip clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool autoChangeImg;

  const SliderImage(
      {super.key,
      this.images,
      this.isLoading = false,
      this.initialPage = 0,
      this.height,
      this.width,
      this.viewportFraction = 1.0,
      this.slideDuration = const Duration(seconds: 3),
      this.moveToNextPageDuration = const Duration(milliseconds: 500),
      this.curve = Curves.ease,
      this.loadingChild,
      this.loadingChildCount = 5,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.controller,
      this.decoration,
      this.clipBehavior = Clip.antiAlias,
      this.margin, this.autoChangeImg = true});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  late PageController _controller;

  Timer? _timer;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        PageController(
            initialPage: widget.initialPage,
            viewportFraction: widget.viewportFraction);
    if(widget.autoChangeImg) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.slideDuration, (timer) {
      if (_currentPage <
          (widget.isLoading
              ? widget.loadingChildCount
              : (widget.images?.length ?? 0))) {
        if (_controller.hasClients) _currentPage++;
        if (_currentPage == (widget.images?.length ?? 0)) _currentPage = 0;
      }

      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: widget.moveToNextPageDuration,
          curve: widget.curve,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? 1.sw,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.isLoading
            ? widget.loadingChildCount
            : (widget.images?.length ?? 0),
        itemBuilder: (BuildContext context, int index) {
          if (widget.isLoading) {
            return widget.loadingChild ??
                LoadingCard(
                    height: widget.height,
                    width: widget.width ?? 1.sw,
                    highlightShimmerColor: widget.highlightShimmerColor,
                    baseShimmerColor: widget.baseShimmerColor);
          }

          var item = widget.images?.elementAt(index);
          return GestureDetector(
            onTap: () {
              Get.to(() => MultipleImageViewer(
                    images: widget.images ?? [],
                    index: index,
                    needMediaUrl: false,
                  ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: widget.height,
                  width: widget.width ?? 1.sw,
                  decoration: widget.decoration,
                  clipBehavior: widget.clipBehavior,
                  margin: widget.margin,
                  child: GeneralNetworkImage(
                      url: widget.images?[index] ?? "",
                      height: widget.height ?? 220.h,
                      width: widget.width ?? 1.sw),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
