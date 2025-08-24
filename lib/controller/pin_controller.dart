import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/utils/app_dialog.dart';
import 'package:b_wallet/utils/app_snack_bar.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  var pin = "";
  String? firstPin;
  bool isConfirm = false;

  void addDigit(String digit) {
    if (pin.length < 6) {
      pin += digit;
      update();

      if (pin.length == 6) {
        if (!isConfirm) {
          firstPin = pin;
          pin = "";
          isConfirm = true;
          Get.toNamed(Routes.confirmPin);
        } else {
          if (pin == firstPin) {
            AppDialog.showSuccessDialog(
              onTap: () {
                Get.offAllNamed(Routes.home);
              },
              buttonTxt: Strings.buttonContinue,
            );
          } else {
            AppSnackBar.showErrorRawSnackBar(message: Strings.notifyPinWrong);
            pin = "";
            update();
          }
        }
      }
    }
  }

  void removeDigit() {
    if (pin.isNotEmpty) {
      pin = pin.substring(0, pin.length - 1);
      update();
    }
  }
}
