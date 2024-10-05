import 'package:flutter/material.dart';



class PasswordValidatorModel {
 final double strength;
 final String displayText;
 final Color? color;

  PasswordValidatorModel(this.strength, this.displayText, [this.color]);
}