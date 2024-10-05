import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/enums/payment_method_type.dart';
import '../../../core/widgets/button/custom_ink_well.dart';
import '../../../core/widgets/images/general_image_assets.dart';
import '../../../core/widgets/style/color.dart';
import '../text/base_text.dart';


class CardPayment extends StatelessWidget {
  final PaymentMethodType paymentMethodType;
  final String selectedPaymentMethodType;
  final Function(PaymentMethodType type) onTab;
  late bool selected=false;


   CardPayment(
      {Key? key, required this.paymentMethodType,required this.selectedPaymentMethodType, required this.onTab})
      : super(key: key){
    selected=selectedPaymentMethodType ==
        paymentMethodType.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: (){
        onTab(paymentMethodType);
      },
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GeneralImageAssets(
              path: paymentMethodType.getImgPath(),
              height: 25.h,
              width: 44.w,
              boxFit: BoxFit.contain,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseText(
                  title: paymentMethodType.getName(),
                  size: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 8.w),


                   Container(
                    height: 16.r,
                    width: 16.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: selected
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                          width: 1.r),
                    ),
                    padding: EdgeInsets.all(3.r),
                    child: Container(
                        decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      selected
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                    )),
                  )

              ],
            )
          ],
        ),
      ),
    );
  }
}
