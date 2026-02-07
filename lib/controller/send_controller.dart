import 'package:b_wallet/routes/app_routes.dart';
import 'package:get/get.dart';

class SendController extends GetxController {
  var number = "0";
  bool correctSend = false;

  void addDigit(String digit) {
    if (number == "0" || suggestionSelected) {
      number = "";
      suggestionSelected = false;
    }
    number += digit;
    correctSend = true;
    update();
  }

  void removeDigit() {
    if (number == "0") return;
    number = number.substring(0, number.length - 1);
    if (number.isEmpty) {
      correctSend = false;
      number = "0";
    }
    update();
  }

  List<String> suggestedNumbers = [
    "100",
    "500",
    "1000",
    "1500",
    "2500",
    "1350",
  ];

  bool suggestionSelected = false;

  void selectFromSuggested(String num) {
    number = num;
    suggestionSelected = true;
    update();
  }

  void submitSend() {
    if (correctSend) {
      Get.toNamed(Routes.securityPin);
    }
  }
}
