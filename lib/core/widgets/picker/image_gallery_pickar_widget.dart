
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res.dart';
import '../images/general_image_assets.dart';
import '../images/general_image_file.dart';
import '../style/color.dart';

class ImageGalleryWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String image;
  final GestureTapCallback? onTap;

  const ImageGalleryWidget(
      {Key? key, this.height, this.width, this.image = '', this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: (width ?? 50.r) + 13.r,
        height: height,
        child: Stack(
          children: [
            // SizedBox(
            //   width: width,
            //   height: height,
            //   child: ClipOval(
            //       child: image.isNotEmpty
            //           ? GeneralImageFile(
            //               path: image,
            //               fit: BoxFit.fill,
            //               width: width,
            //               height: height,
            //             )
            //           : GeneralImageAssets(
            //               path: Res.emptyImgPicker,
            //               boxFit: BoxFit.fill,
            //               width: width,
            //             )),
            // ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 25.r,
                  width: 25.r,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainColor),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white,
                    size: 15.r,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
