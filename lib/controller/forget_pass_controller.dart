import 'dart:ui';

import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  ForgetPassMethod forgetPassMethod = ForgetPassMethod.none;

  void chooseForgetPassMethod(ForgetPassMethod method) {
    forgetPassMethod = method;
    update(['method']);
  }

  void methodChosen() {
    if (forgetPassMethod != ForgetPassMethod.none) {
      Get.toNamed(
          forgetPassMethod == ForgetPassMethod.sms ? Routes.otp : Routes.email);
    } else {
      Get.snackbar(
        '',
        '',
        animationDuration: const Duration(milliseconds: 300),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: ColorConst.orangeColor.withValues(alpha: 0.3),
        barBlur: 50,
        titleText: CustomText(
          txt: Strings.notifyWrong,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        messageText: CustomText(
          txt: Strings.notifyChooseForgetMethod,
          fontSize: 13.sp,
        ),
      );
    }
  }
}

enum ForgetPassMethod { sms, email, none }
