import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/models/profile_setting_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:get/get.dart';

class TopUpController extends GetxController {
  var number = "0";

  void addDigit(String digit) {
    if (number == "0") {
      number = "";
    }
    number += digit;
    update();
  }

  void removeDigit() {
    if (number == "0") return;
    number = number.substring(0, number.length - 1);
    if (number.isEmpty) {
      number = "0";
    }
    update();
  }

  List<CardModel> cards = [
    CardModel(
      id: 0,
      image: ImageConst.masterCard,
      cardType: 'Master Card',
      cardNumber: '4246 7515 4553 5246',
      expiryMonth: 6,
      expiryYear: 2029,
      cvc: '353',
    ),
    CardModel(
      id: 1,
      image: ImageConst.visa,
      cardType: 'VISA',
      cardNumber: '4000 7556 4574 5534',
      expiryMonth: 6,
      expiryYear: 2029,
      cvc: '456',
    ),
  ];

  int? selectedMethod;

  void onChangeSelectedMethod(int? value) {
    selectedMethod = value;
    Get.back();
    update();
  }

  final ProfileSettingModel addCardItem = ProfileSettingModel(
    icon: ImageConst.topUpIcon,
    title: Strings.buttonAddNewCard,
    onTap: () {
      Get.toNamed(Routes.addNewCard);
    },
  );
}
