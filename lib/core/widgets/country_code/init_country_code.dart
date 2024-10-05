import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

import 'my_country_picker.dart';
import 'my_country_picker_dialog.dart';

class InitCountryCode extends StatefulWidget {
  final ValueChanged<Country>? onValuePicked;
  final Country selectedCountry;
  final ValueChanged<Country>? onSelectedCountry;
  final bool showFlag;
  final bool needNumber;
  final double? width;
  final double? padding;

  const InitCountryCode(
      {Key? key,
      this.onValuePicked,
      required this.selectedCountry,
      this.onSelectedCountry,
      this.showFlag = true, this.width, this.padding,this.needNumber=true})
      : super(key: key);

  @override
  State<InitCountryCode> createState() => _InitCountryCodeState();
}

class _InitCountryCodeState extends State<InitCountryCode> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await openCountryDialog(context,
            onValuePicked: widget.onValuePicked,
            onSelectedCountry: widget.onSelectedCountry);
      },
      child: MyCountryPicker(
          country: widget.selectedCountry,
          padding: widget.padding,
          width: widget.width,
          needNumber: widget.needNumber,
          showFlag: widget.showFlag),
    );
  }
}

Future<Country?> openCountryDialog(BuildContext context,
    {String? search,
    String? selectedHint,
    ValueChanged<Country>? onValuePicked,
    ValueChanged<Country>? onSelectedCountry}) async {
  return showDialog<Country>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return MyCountryPickerDialog(
        searchHint: search,
        selectHint: selectedHint,
        onValuePicked: onValuePicked,
      );
    },
  );
}

Country initCountry(String num) {
  return Country(
      phoneCode: CountryPickerUtils.getCountryByPhoneCode(num).phoneCode,
      name: CountryPickerUtils.getCountryByPhoneCode(num).name,
      iso3Code: CountryPickerUtils.getCountryByPhoneCode(num).iso3Code,
      isoCode: CountryPickerUtils.getCountryByPhoneCode(num).isoCode);
}
