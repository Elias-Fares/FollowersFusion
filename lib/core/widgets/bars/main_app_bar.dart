import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res.dart';
import '../../../utlis/translation/local_keys.dart';
import '../../../utlis/translation/translation.dart';
import '../button/custom_ink_well.dart';
import '../images/general_image_assets.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String appName;
  final VoidCallback onEditPress;
  final VoidCallback onDrawerPress;

  const MainAppBar({Key? key,required this.appName,
    required this.onEditPress ,
    required this.onDrawerPress ,
  })
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: false,
        actions: [
          Container(
            width: 30.w,
            margin: EdgeInsets.only(
                right: AppLanguageKeys.isRTL() ? 0 : 24.w,
                left: AppLanguageKeys.isRTL() ? 24.w : 0),
            child: CustomInkWell(
              onTap: widget.onEditPress,

              child: GeneralImageAssets(path: Res.editColorImg,
                  boxFit: BoxFit.contain),
            ),
          ),
          SizedBox(width: 4,),
          Container(
            width: 30.w,
            margin: EdgeInsets.only(
                right: AppLanguageKeys.isRTL() ? 0 : 24.w,
                left: AppLanguageKeys.isRTL() ? 24.w : 0),
            child: CustomInkWell(
              onTap: widget.onDrawerPress,

              child: GeneralImageAssets(path: Res.icDrawer,
                  boxFit: BoxFit.contain),
            ),
          )
        ],

        title: const Row(
          children: [

          GeneralImageAssets(path: Res.followers_logo,height: 40,width: 40,
          boxFit: BoxFit.contain,)
        ]
        )



    )

    ;
  }
}
