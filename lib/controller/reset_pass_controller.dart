import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/utils/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      AppDialog.showSuccessDialog(
        onTap: () {
          Get.back();
          Get.offAllNamed(Routes.splash);
        },
        buttonTxt: Strings.buttonOk,
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
