import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCountryPicker extends StatelessWidget {
  final double? width;
  final double? padding;
  final Country? country;
  final bool needNumber;
  final bool showFlag;

  const MyCountryPicker(
      {Key? key,
      this.width,
      this.padding,
      this.country,
      this.needNumber = true,
      this.showFlag = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(padding??0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          needNumber
              ? Text(
                  "+${country!.phoneCode}",
                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                )
              : const SizedBox(),
         if(showFlag)
           ...[SizedBox(width: 5.sp),
          CountryPickerUtils.getDefaultFlagImage(
              CountryPickerUtils.getCountryByPhoneCode(country!.phoneCode))],
          // const SizedBox(width: 7),
          // SvgPicture.asset(
          //   Res.dropDownVector,
          //   width: 12,
          //   height: 6,
          // )
        ],
      ),
    );
  }
}
