import 'package:flutter/material.dart';
import '../../../core/widgets/style/color.dart';

class CustomSeekbar extends StatelessWidget {
  double seekbarValue;
  double? seekbarMaxValue;
  double? seekbarMinValue;
  int? divisions;
  Function(double value)? onChang;

   CustomSeekbar({
     Key? key,
     required this.seekbarValue,
     this.seekbarMaxValue=100,
     this.seekbarMinValue=10,
     this.divisions=10,
     this.onChang
   }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          valueIndicatorColor: AppColors.mainColor,
          overlayShape: SliderComponentShape.noOverlay,
          valueIndicatorTextStyle:
          const TextStyle(color: AppColors.white)),
      child: Slider(
        value:seekbarValue,
        max: seekbarMaxValue!,
        min: seekbarMinValue!,
        divisions: divisions,
        activeColor: AppColors.iconColorV1,
        inactiveColor: AppColors.iconColorV1.withOpacity(.1),
        label: seekbarValue.toString(),
        onChanged: onChang,
      ),
    );
  }
}
