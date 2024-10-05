import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app/controller/ThemeController.dart';
import '../../app/controller/app_lang_controller.dart';
import '../../core/constant.dart';
import '../../data/dio/dio_settings.dart';
import '../../data/get_storage_helper.dart';
import '../../data/http_helper.dart';
import '../../data/repository.dart';

import '../../screen/auth/controllers/login_controller.dart';
import '../../screen/auth/controllers/register_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ThemeController());
    Get.lazyPut(()=>((Dio(BaseOptions(

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8"
        },
        responseType: ResponseType.plain)))),tag: PROJECT_API , fenix: true);

    Get.lazyPut(
        () => ((Dio(BaseOptions(
            baseUrl: BaseUrlGoogle,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "charset": "utf-8",
              "Accept-Charset": "utf-8"
            },
            responseType: ResponseType.plain)))),
        tag: GOOGLE_API,
        fenix: true);
    Get.lazyPut(() => GetStorageHelper(), fenix: true);
    Get.lazyPut(() => AppLangController(), fenix: true);
    Get.lazyPut(() => DioSetting(), fenix: true);
    Get.lazyPut(() => Repository(), fenix: true);
    Get.lazyPut(() => HttpHelper(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);




  }
}
