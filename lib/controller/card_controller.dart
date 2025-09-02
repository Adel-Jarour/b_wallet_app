import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/models/profile_setting_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final ProfileSettingModel addCardItem = ProfileSettingModel(
    icon: ImageConst.topUpIcon,
    title: Strings.buttonAddNewCard,
    onTap: () {
      Get.toNamed(Routes.addNewCard);
    },
  );

  List<CardModel> cards = [];

  void addCard(CardModel card) {
    cards.add(card);
    update();
  }
}
