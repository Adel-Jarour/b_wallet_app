import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/lottie_animations.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmailController extends GetxController {
  final emailController = TextEditingController();

  String? confirmError;
  bool isLoading = false;

  bool checkEmail() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      confirmError = "Email field cannot be empty";
      update();
      return false;
    }
    confirmError = null;
    update();
    return true;
  }

  void submitEmail() async {
    if (checkEmail()) {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 2));
      isLoading = false;
      update();
      Get.dialog(
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Lottie.asset(
            LottieAnimations.successCheck,
            fit: BoxFit.fitHeight,
            height: 130.h,
            width: 130.w,
            repeat: false,
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            bottom: 24.h,
          ),
          buttonPadding: EdgeInsets.zero,
          backgroundColor: ColorConst.whiteColor,
          content: CustomText(
            txt: Strings.emailSuccessDialogMsg,
            fontSize: 14.sp,
            height: 1.3,
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: CustomButton(
                txt: Strings.buttonOk,
                width: 160.w,
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
