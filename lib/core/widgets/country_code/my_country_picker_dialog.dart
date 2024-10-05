import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

class MyCountryPickerDialog extends StatelessWidget {
  final String? searchHint;
  final String? selectHint;

  final ValueChanged<Country>?onValuePicked;

  const MyCountryPickerDialog({Key? key,
    this.searchHint="Search...",
    this.selectHint="Select your country code",
    this.onValuePicked
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryPickerDialog(
        titlePadding: const EdgeInsets.all(8.0),
        searchCursorColor: Colors.black,
        searchInputDecoration: InputDecoration(hintText: searchHint ?? "search"),
        isSearchable: true,
        title: Text(selectHint==null?"select your country code":selectHint!),
        onValuePicked: onValuePicked!,
        itemBuilder: (Country country) {
          return Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(width: 16.0),
              Text("+${country.phoneCode}(${country.isoCode})"),
            ],
          );
        });
  }
}
