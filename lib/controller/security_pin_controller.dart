import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/utils/app_snack_bar.dart';
import 'package:get/get.dart';

class SecurityPinController extends GetxController {
  late final String? routeName;
  late final String? appBarTitle;
  late final Map<String, dynamic> infoMap;

  var pin = "";
  String correctPin = "555555";

  void addDigit(String digit) {
    if (pin.length < 6) {
      pin += digit;
      update();
      if (pin.length == 6) {
        if (pin == correctPin) {
          Get.offNamed(routeName!, arguments: infoMap);
        } else {
          AppSnackBar.showErrorRawSnackBar(message: Strings.notifyPinWrong);
          pin = "";
          update();
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appBarTitle = Get.arguments['app_bar_title'] as String;
    routeName = Get.arguments['route_name'] as String;
    infoMap = Get.arguments['info'];
  }
}
