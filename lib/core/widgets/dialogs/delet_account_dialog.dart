import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utlis/translation/local_keys.dart';
import '../text/base_text.dart';

Future<bool> deleteAccountDialog(BuildContext context) async {
  bool item = await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: BaseText(
              title:
              LocalKeys.delete_account.tr,
              fontWeight: FontWeight.w500,
              size: 18.sp),
          content: BaseText(
              title:LocalKeys.do_you_delete_account.tr,
              size: 16.sp),
          actions: [
            TextButton(
              child: BaseText(
                  title: LocalKeys.no.tr,
                  color: Colors.red,
                  size: 16.sp),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: BaseText(
                  title: LocalKeys.yes.tr,
                  color: Colors.greenAccent,
                  size: 16.sp),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        ),
      );
    },
  );
  return item;
}