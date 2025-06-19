import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.whiteColor,
    textColor: AppColors.blackColor,
    fontSize: 16.0,
  );
}
