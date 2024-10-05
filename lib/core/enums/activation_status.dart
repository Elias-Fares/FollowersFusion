import 'package:get/get.dart';

import '../../utlis/translation/local_keys.dart';

enum ActivationStatus{enable, disable}

extension ActivationStatusExtension on ActivationStatus {
  getTitle() {
    switch (this) {
      case ActivationStatus.enable:
        return LocalKeys.enable.tr;
      case ActivationStatus.disable:
        return LocalKeys.disable.tr;
    }
  }

  getValue() {
    switch (this) {
      case ActivationStatus.enable:
        return 1;
      case ActivationStatus.disable:
        return 0;
    }
  }
}