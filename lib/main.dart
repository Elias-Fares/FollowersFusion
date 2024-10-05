import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'core/functions/get_device_details.dart';
import 'core/payment_methods_widget/payment_helper.dart';
import 'core/widgets/style/color.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //to get app version number
  getAppVersion();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  // if (!kIsWeb) {
  //   await setupFlutterNotifications();
  // }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.white.withOpacity(.6)
  ));


  PaymentHelper.initializePaymentSDK();
  // MainBinding().dependencies();

  runApp( const App());

}