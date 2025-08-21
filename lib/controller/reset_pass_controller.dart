import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/lottie_animations.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPassController extends GetxController {
  bool showNewPass = true;
  bool showConfirmPass = true;

  void updateShowNewPass() {
    showNewPass = !showNewPass;
    update();
  }

  void updateShowConfirmPass() {
    showConfirmPass = !showConfirmPass;
    update();
  }

  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  String? confirmError;
  bool isLoading = false;

  bool checkPass() {
    String newPass = newPassController.text.trim();
    String confirmPass = confirmPassController.text.trim();

    if (newPass.isEmpty || confirmPass.isEmpty) {
      confirmError = "Password fields cannot be empty";
      update();
      return false;
    } else if (newPass != confirmPass) {
      confirmError = "Passwords do not match";
      update();
      return false;
    }
    confirmError = null;
    update();
    return true;
  }

  void submitPassword() async {
    if (checkPass()) {
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
            txt: Strings.resetPassSuccessDialogMsg,
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
                  Get.offAllNamed(Routes.splash);
                },
              ),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  @override
  void onClose() {
    newPassController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}
