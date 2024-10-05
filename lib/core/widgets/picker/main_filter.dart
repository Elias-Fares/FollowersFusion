import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';
import '../text/base_text.dart';

class MainFilter extends StatelessWidget {
  bool? selected;
  String? title;
  //arrow
  Color? selectedArrowColor;
  Color? unSelectedArrowColor;
  //border
  Color? selectedBorderColor;
  Color? unSelectedBorderColor;

  //background
  Color? bgSelectedColor;
  Color? bgUnselectedColor;
  //title
  Color? selectedTitleColor;
  Color? unSelectedTitleColor;

  VoidCallback? onPress;

   MainFilter({Key? key,
     this.title="",
     this.selected=false,
     this.selectedArrowColor=AppColors.white,
     this.unSelectedArrowColor=AppColors.iconColorV1,
   this.selectedTitleColor=AppColors.white,
  this.unSelectedTitleColor=AppColors.iconColorV1,
  this.bgSelectedColor=AppColors.iconColorV1,
  this.bgUnselectedColor=AppColors.white,
  this.selectedBorderColor =AppColors.iconColorV1,
  this.unSelectedBorderColor =AppColors.iconColorV1,
  this.onPress,
   }) : super(key: key);


  ShapeBorder roundedBorderSelected({required double radius}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none
    );
  }

  ShapeBorder roundedBorderUnSelected({required double radius}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: unSelectedBorderColor!,


        )
    );
  }


   Widget SelectedItem(){
    return  InkWell(
      onTap: onPress,
      child: Card(
        color: bgSelectedColor,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: roundedBorderSelected(radius: 6.r),



        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              BaseText(
                  title:title??"",
                  size: 11,
                  color: selectedTitleColor,

              ),
              SizedBox(width: 9.w,),
              Icon(Icons.arrow_drop_down_sharp,color: selectedArrowColor,size: 14.h,)

            ],
          ),
        ),


      ),
    );
   }

   Widget UnSelectedItem(){
    return  InkWell(
      onTap: onPress,
      child: Card(
        color: bgUnselectedColor,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: roundedBorderUnSelected(radius: 6.r),


        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              BaseText(
                title:title??"",
                size: 11,
                color: unSelectedTitleColor,

              ),
              SizedBox(width: 9.w,),
              Icon(Icons.arrow_drop_down_sharp,color: unSelectedArrowColor,size: 14.h,)

            ],
          ),
        ),


      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return selected!?SelectedItem():UnSelectedItem();
  }
}
