import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


import '../widgets/style/color.dart';

class TextInput extends StatelessWidget {
  final String name;
  final String hint;
  final TextInputType inputType;
  final String? Function(String?) validator;
  final int? maxLength;

  const TextInput({
    Key? key,
    required this.name,
    required this.hint,
    required this.inputType,
    required this.validator,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    bool darkModeOn = brightness == Brightness.dark;
    return FormBuilderTextField(
      name: name,
      validator: validator,
      keyboardType: inputType,
      maxLength: maxLength,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        // fillColor: AppColors.descColor4V1(darkModeOn),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(fontSize: 14),
        errorStyle: const TextStyle(fontSize: 12),
        counter: const SizedBox.shrink(),
      ),
    );
  }
}
