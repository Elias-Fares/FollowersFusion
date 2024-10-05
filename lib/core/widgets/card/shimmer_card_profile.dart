import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utlis/translation/local_keys.dart';
import '../../constant.dart';
import '../images/general_network_image.dart';
import '../style/color.dart';
import '../text/base_text.dart';

class ShimmerCardProfile extends StatelessWidget {
  final String image;


  final VoidCallback? onPress;
   const ShimmerCardProfile({Key? key,this.image=TEMP_IMAGE,this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Shimmer.fromColors(
          baseColor:  AppColors.baserColor,
          highlightColor:  AppColors.shimmerColor,
        child: Row(


        children: [


          SizedBox(
            width: 58.h,
            height: 58.h,
            child: ClipOval(
                child:
                GeneralNetworkImage(
                  url: image,
                  boxFit: BoxFit.fill,
                )
            ),
          ),

          SizedBox(width: 12.w,),

          Expanded(child:     Column(
            children: [
              Row(children: [Expanded(child: BaseText(title: 'jone',size: 16.sp,fontWeight: FontWeight.w600,
                maxLines: 1,))],),
              SizedBox(height: 5.h,),

              Row(children: [Expanded(child: BaseText(title: 'email@email.com',size: 12.sp,fontWeight: FontWeight.w400,
                maxLines: 2,color: AppColors.thirdMainColor.withOpacity(0.6),))],),
              SizedBox(height: 5.h,),
              Row(children: [Expanded(child: InkWell(
                onTap: (){},
                child: BaseText(title: LocalKeys.edit_profile.tr,size: 12.sp,fontWeight: FontWeight.w400,
                  maxLines: 1,color: AppColors.iconColorV1,),
              ))],),
              SizedBox(height: 5.h,),
            ],
          ))
        ],
    ),
      );
  }
}
