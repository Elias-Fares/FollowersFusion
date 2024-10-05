import '../widgets/style/color.dart';
import 'show_snack_bar_message.dart';

Future showServerMessages(List? errors, {bool isError = true}) async{
  if (errors != null) {
    for (var element in errors) {
      if (element != null) {
        showSnackBarMessage(
            message: element.toString(),
            color: isError ? AppColors.red : AppColors.lightGreen);
        const Duration(milliseconds: 500);
      }
    }
  }
}
