import 'package:get/get.dart';

import '../../utlis/translation/local_keys.dart';
import '../constant.dart';

enum LangType { en, ar }

extension LangTypeExtension on LangType {
  getTitle() {
    switch (this) {
      case LangType.en:
        return LocalKeys.english.tr;
      case LangType.ar:
        return LocalKeys.arabic.tr;
    }
  }

  getValue() {
    switch (this) {
      case LangType.en:
        return EN;
      case LangType.ar:
        return AR;
    }
  }
}
