import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../enums/image_type.dart';
import '../card/loading_card.dart';
import 'general_image_assets.dart';
import 'general_image_file.dart';
import 'general_network_image.dart';

class MultipleImageLayer extends StatelessWidget {
  final double? height;
  final double? width;
  final StackFit fit;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final Clip clipBehavior;
  final List<Widget> children;
  final bool isLoading;
  final Widget? loadingChild;
  final int loadingChildCount;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;

  const MultipleImageLayer({
    Key? key,
    this.isLoading = false,
    this.height,
    this.width,
    this.children = const [],
    this.fit = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.clipBehavior = Clip.hardEdge,
    this.loadingChild,
    this.loadingChildCount = 5,
    this.baseShimmerColor,
    this.highlightShimmerColor,
  }) : super(key: key);

  static Builder builder(
      {Key? key,
      int? itemCount,
      IndexedWidgetBuilder? builder,
      bool isLoading = false,
      double? height,
      double? width,
      TextDirection? textDirection,
      Widget? loadingChild,
      int loadingChildCount = 5,
      List<String> images = const [],
      double? spaceBetweenImages,
      double? imageHeight,
      double? imageWidth,
      BoxFit imageFit = BoxFit.cover,
      BoxShape imageShape = BoxShape.rectangle,
      BorderRadiusGeometry? imageBorderRadius,
      BoxBorder? imageBorder,
      Clip clipImage = Clip.antiAlias,
      ImageType imageType = ImageType.network,
      Widget? imagePlaceHolderWhileLoading,
      Color? imageColor,
      Widget? failWidget,
      StackFit fit = StackFit.loose,
      AlignmentGeometry alignment = AlignmentDirectional.topStart,
      Color? baseShimmerColor,
      Color? highlightShimmerColor,
      Clip clipBehavior = Clip.hardEdge}) {
    return Builder(
      key: key,
      builder: (BuildContext context) {
        assert(images.isEmpty || builder == null,
            'Cannot provide both images and builder');

        assert(!(builder != null && itemCount == null), 'Please add itemCount');
        assert(builder == null || (itemCount != null && itemCount >= 0),
            'itemCount must be greater than or equal to 0');

        return MultipleImageLayer(
          key: key,
          isLoading: isLoading,
          loadingChild: loadingChild,
          loadingChildCount: loadingChildCount,
          height: height,
          width: width,
          clipBehavior: clipBehavior,
          fit: fit,
          alignment: alignment,
          textDirection: textDirection,
          children: List.generate(itemCount ?? images.length, (index) {
            if (builder != null) {
              return builder(context, index);
            }
            return MultipleImageLayerItem(
                isLoading: isLoading,
                imagePath: images[index],
                spaceBetweenImages: (spaceBetweenImages ?? 0) * index,
                failWidget: failWidget,
                highlightShimmerColor: highlightShimmerColor,
                baseShimmerColor: baseShimmerColor,
                width: imageWidth,
                height: imageHeight,
                clipImage: clipImage,
                imageBorder: imageBorder,
                imageBorderRadius: imageBorderRadius,
                imageColor: imageColor,
                imageFit: imageFit,
                imagePlaceHolderWhileLoading: imagePlaceHolderWhileLoading,
                imageShape: imageShape,
                imageType: imageType);
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getLoadingChildren() {
      return List.generate(
          loadingChildCount,
          (index) =>
              loadingChild ??
              LoadingCard(
                  height: 30.h,
                  width: 30.h,
                  borderRadius: BorderRadius.circular(6.r),
                  highlightShimmerColor: highlightShimmerColor,
                  baseShimmerColor: baseShimmerColor));
    }

    return SizedBox(
      height: height ?? 30.h,
      width: width,
      child: Stack(
          fit: fit,
          alignment: alignment,
          clipBehavior: clipBehavior,
          children: isLoading ? getLoadingChildren() : children),
    );
  }
}

class MultipleImageLayerItem extends StatelessWidget {
  final bool isLoading;
  final double? height;
  final double? width;
  final BoxFit imageFit;
  final BoxShape imageShape;
  final BorderRadiusGeometry? imageBorderRadius;
  final BoxBorder? imageBorder;
  final Clip clipImage;
  final ImageType imageType;
  final String imagePath;
  final Widget? imagePlaceHolderWhileLoading;
  final Color? imageColor;
  final Widget? failWidget;
  final double? spaceBetweenImages;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;

  const MultipleImageLayerItem({
    super.key,
    required this.imagePath,
    this.isLoading = false,
    this.height = 50,
    this.width = 50,
    this.imageFit = BoxFit.cover,
    this.imageShape = BoxShape.rectangle,
    this.imageBorderRadius,
    this.imageBorder,
    this.clipImage = Clip.antiAlias,
    this.imageType = ImageType.network,
    this.imagePlaceHolderWhileLoading,
    this.imageColor,
    this.failWidget,
    this.spaceBetweenImages,
    this.baseShimmerColor,
    this.highlightShimmerColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingCard(
        height: 30.h,
        width: 30.w,
        shape: BoxShape.rectangle,
        borderRadius: imageBorderRadius,
        highlightShimmerColor: highlightShimmerColor,
        baseShimmerColor: baseShimmerColor,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: spaceBetweenImages),
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: imageShape,
              borderRadius: imageBorderRadius,
              border: imageBorder,
            ),
            clipBehavior: clipImage,
            child: getImage()),
      ],
    );
  }

  Widget getImage() {
    switch (imageType) {
      case ImageType.network:
        return GeneralNetworkImage(
            url: imagePath,
            width: width,
            height: height,
            boxFit: imageFit,
            color: imageColor,
            failWidget: failWidget,
            placeHolderWhileLoading: imagePlaceHolderWhileLoading);

      case ImageType.asset:
        return GeneralImageAssets(
          path: imagePath,
          width: width,
          height: height,
          boxFit: imageFit,
          color: imageColor,
        );
      case ImageType.file:
        return GeneralImageFile(
            path: imagePath,
            width: width,
            height: height,
            fit: imageFit,
            color: imageColor);
    }
  }
}
