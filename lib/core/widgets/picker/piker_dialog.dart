import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../res.dart';
import '../../../utlis/translation/local_keys.dart';
import '../button/buttons/loading_button.dart';
import '../dialogs/animated_dialog.dart';
import '../images/general_image_assets.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class PikerDialog extends StatelessWidget {
  const PikerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.image_outlined,
          size: 100.r,
          color: AppColors.darkGray,
        ),
        SizedBox(height: 25.h),
        Flexible(child: BaseText(title: LocalKeys.select_way_pike_image.tr)),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: LoadingButton(
                height: 45.h,
                color: AppColors.fifthMainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GeneralImageAssets(
                    //     path: Res.galleryIcon,
                    //     height: 18.h,
                    //     width: 18.w,
                    //     boxFit: BoxFit.contain),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: BaseText(
                          title: LocalKeys.from_gallery.tr,
                          color: AppColors.white,
                          size: 12.sp,
                          fontWeight: FontWeight.w600,
                          maxLines: 1),
                    ),
                  ],
                ),
                onPressed: () async {
                  final String? img = await selectImageFromGallery(
                      imageSource: ImageSource.gallery);
                  Get.back(result: img);
                },
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: LoadingButton(
                height: 45.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GeneralImageAssets(
                    //   path: Res.generalCameraIcon,
                    //   height: 18.h,
                    //   width: 18.w,
                    //   boxFit: BoxFit.contain,
                    // ),
                    SizedBox(width: 4.w),
                    BaseText(
                      title: LocalKeys.take_photo.tr,
                      color: AppColors.white,
                      size: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                onPressed: () async{
                  final String? img = await selectImageFromGallery(
                      imageSource: ImageSource.camera);
                  Get.back(result: img);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

Future<String?> openPikerDialog() async {
  return await getAnimatedDialog<String?>(
      content: PikerDialog(), curve: Curves.easeIn);
}

Future<String?> selectImageFromGallery(
    {required ImageSource imageSource}) async {
  if (await Permission.storage.request().isGranted) {
    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: imageSource);

    if (response != null) {
      if (kDebugMode) {
        print(response.path);
      }
      return response.path;
    }
  } else {
    await Permission.storage.request();
  }
  return null;
}
