import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../button/custom_ink_well.dart';
import 'general_image_assets.dart';
import 'general_image_file.dart';
import 'general_network_image.dart';
import '../style/color.dart';

class MultipleImageViewer extends StatefulWidget {
  final List<String> images;
  final bool formLocal;
  final bool needMediaUrl;
  final int index;

  const MultipleImageViewer(
      {Key? key,
      required this.images,
      this.formLocal = false,
      this.needMediaUrl = true,
      this.index = 0})
      : assert(images.length > index),
        super(key: key);

  @override
  State<MultipleImageViewer> createState() => _MultipleImageViewerState();
}

class _MultipleImageViewerState extends State<MultipleImageViewer> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        leading: CustomInkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, size: 19.r, color: AppColors.white),
        ),
      ),
      body: Center(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (value) {},
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return widget.formLocal
                ? GeneralImageAssets(
                    path: widget.images[index],
                    height: Get.height,
                    width: Get.width,
                    boxFit: BoxFit.contain,
                  )
                : GeneralNetworkImage(
                    url:
                        "${widget.needMediaUrl ? Constant.mediaUrl : ""}${widget.images[index]}",
                    boxFit: BoxFit.contain,
                    height: Get.height,
                    width: Get.width);
          },
        ),
      ),
    );
  }
}
