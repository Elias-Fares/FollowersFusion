

import 'package:get/get.dart';

import '../../../core/messages/show_snack_bar_message.dart';
import '../../../data/repository.dart';


class RegisterController extends GetxController{
  final Repository _repository = Get.find();

  var isLoading=false.obs;



  Future<void>registerRQ({
    required String userName,required String name,
    String? image,String? phone,required String password,

  })async{
    isLoading.value=true;

    var response=await _repository.register(
        userName: userName,
        name: name,
        password: password,
      image: image,
      phone: phone

    );
    if(response.success){

      showSnackBarMessage(message: "success");
     // Get.to(()=>const MainScreen());

    }else{
      showSnackBarMessage(message: response.msg.elementAt(0));

    }
    isLoading.value=false;



  }
}