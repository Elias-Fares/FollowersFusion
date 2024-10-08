// ignore_for_file: constant_identifier_names
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utlis/translation/local_keys.dart';
import 'enums/lang_type.dart';
import 'enums/payment_method_type.dart';

const String AR = "ar";
const String EN = "en";

const TEMP_IMAGE =
    "";

const String PROJECT_API = "project_api";
const String GOOGLE_API = "google_api";
const String BaseUrlGoogle = "https://maps.googleapis.com/maps/api/";
const GoogleToken = "";

const SFPro = 'SfPro';
const Almarai = 'Almarai';

const ADULT_UPLOAD_PASSPORT = "upload passport";
const ADULT_UPLOAD_FAMILY_CARD = "upload family card";
const ADULT_UPLOAD_PERSONAL_IMAGE = "upload personal image";
const SPONSOR_UPLOAD_PASSPORT = "upload passport";
const SPONSOR_UPLOAD_BANK_STATEMENT = "upload family card";
const SPONSOR_UPLOAD_JOB_LETTER = "upload personal image";
const SPLIT_VALUE_VISA_QUESTION = "****";

class Constant {
  static String getBaseUrl =
      '';
  static String baseUrl = '';
  static String mediaUrl = '';
  static String appCurrency = Currencies.sar;
  static const String ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const String APP_LANGUAGE = 'APP_LANGUAGE';
  static const String FIRST_OPEN = 'FIRST_OPEN';
  static const String USER_ID = 'FIRST_OPEN';


  static const double TextFieldBorder = 6.0;
  static const double TextFieldBorderWidth = 1.0;




  //payment method
  static const String myFatorahTestToken =
      "";

  static const String myFatorahLiveToken ="";

  static const String paymentSuccessStatus = 'success';
  static const String paymentErrorStatus = 'error';

  static const List<PaymentMethodType> paymentMethodList = [
    PaymentMethodType.mada,
    PaymentMethodType.visa,
    PaymentMethodType.master,
    PaymentMethodType.stcPay,
    PaymentMethodType.amex,
  ];



  static List<double> galleryCardSizesList = [
    163.h,
    121.h,
  ];

  static const List<String> relationWithSponsorList = [
    LocalKeys.father,
    LocalKeys.mother,
    LocalKeys.sister,
    LocalKeys.brother,
    LocalKeys.son,
    LocalKeys.wife,
    LocalKeys.husband,
  ];



  static const String QUESTION_INPUTS_FILE = 'file';
  static const String QUESTION_INPUTS_LONG_INPUT_TEXT = 'long_input_text';
  static const String QUESTION_INPUTS_INPUT_TEXT_WITH_DROP_DOWN =
      'input_text_with_dropdown';
  static const String QUESTION_INPUTS_DATE = 'date';
  static const String QUESTION_INPUTS_INPUT_TEXT = 'input_text';
  static const String QUESTION_INPUTS_DROP_DOWN = 'drop_down';



  static const String BEST_SELL_PRODUCT = 'sold_count';
  static const String LATEST_PRODUCT = 'latest';
  static const String NEW_ARRIVALS_PRODUCT = 'created_at';
  static const String SPECIAL_OFFERS_PRODUCT = 'discount';
}

class LocalStaticVar {
  static String token = '';
  static String userId = '';
  static String userName = '';
  static String appVersion = '';
  static  String fontFamily = SFPro;

}

class Currencies {
  static String sar = LocalKeys.sar;
  static String usd = '\$';
}

List<LangType> appLanguages = [
  LangType.en,
  LangType.ar,
];


class Languages {
  static const List<LangType> appLanguages = [
    LangType.en,
    LangType.ar,
  ];

}
