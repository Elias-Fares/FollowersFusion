import 'package:get/get.dart';

import '../../utlis/translation/local_keys.dart';

enum GenderType {male, female}

extension GenderTypeExtension on GenderType {
  String getTitle() {
    switch (this) {
      case GenderType.male:
        return LocalKeys.male.tr;
      case GenderType.female:
        return LocalKeys.female.tr;
    }
  }

  String getValue() {
    switch (this) {
      case GenderType.male:
        return 'male';
      case GenderType.female:
        return 'female';
    }
  }
}