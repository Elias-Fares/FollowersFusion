import 'package:followers/screen/requset_services_screen/requset_services.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


import '../screen/auth/forgot_password_screen.dart';
import '../screen/auth/login_screen.dart';
import '../screen/auth/reset_password_screen.dart';
import '../screen/auth/sign_up_screen.dart';
import '../screen/auth/splash_screen.dart';
import '../screen/auth/verify_code_reset_password_screen.dart';
import '../screen/auth/welcome_screen.dart';
import '../screen/home_screen/home.dart';


class Routs {
  static final List<GetPage> getPages = [


    loginScreenRoute,
    signUpScreenRoute,
    forgotPasswordScreenRoute,
    welcomeScreenRoute,
    resetPasswordScreenRoute,
    verifyCodeResetPasswordScreenRoute,
    splashScreenRoute,
    homeScreenRoute,
    requestServicesScreenRoute,

  ];
  static final GetPage loginScreenRoute =
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen());
  static final GetPage signUpScreenRoute =
  GetPage(name: SignUpScreen.routeName, page: () => const SignUpScreen());
  static final GetPage forgotPasswordScreenRoute =
  GetPage(name: ForgotPasswordScreen.routeName, page: () => const ForgotPasswordScreen());
  static final GetPage welcomeScreenRoute =
  GetPage(name: WelcomeScreen.routeName, page: () => const WelcomeScreen());

  static final GetPage resetPasswordScreenRoute =
  GetPage(name: ResetPasswordScreen.routeName, page: () => const ResetPasswordScreen());

  static final GetPage verifyCodeResetPasswordScreenRoute =
  GetPage(name: VerifyCodeResetPasswordScreen.routeName, page: () => const VerifyCodeResetPasswordScreen());



  static final GetPage splashScreenRoute =
  GetPage(name: SplashScreen.routeName, page: () => const SplashScreen());


  static final GetPage homeScreenRoute =
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen());

  static final GetPage requestServicesScreenRoute =
  GetPage(name: RequestServicesScreen.routeName, page: () => const RequestServicesScreen());




}
