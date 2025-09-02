import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/card_controller.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewCardController extends GetxController {
  late CardModel newCard;

  TextEditingController cardType = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController monthExpiredDate = TextEditingController();
  TextEditingController yearExpiredDate = TextEditingController();
  TextEditingController cvc = TextEditingController();

  List<CardTypeModel> cardTypes = [
    CardTypeModel(
      index: 0,
      image: ImageConst.masterCard,
      type: Strings.savedCardMasterCard,
    ),
    CardTypeModel(
      index: 1,
      image: ImageConst.visa,
      type: Strings.savedCardVISA,
    ),
    CardTypeModel(
      index: 2,
      image: ImageConst.paypal,
      type: Strings.savedCardPaypal,
    ),
  ];

  final List<String> months = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  final List<String> years = List.generate(
    10,
    (index) => (DateTime.now().year + index).toString(),
  );

  final formKey = GlobalKey<FormState>();
  int selectedCardTypeIndex = 0;

  void updateSelectedCardTypeIndex(int index) {
    selectedCardTypeIndex = index;
  }

  void submitSaveCard() {
    if (formKey.currentState!.validate()) {
      newCard = CardModel(
        image: cardTypes[selectedCardTypeIndex].image,
        cardType: cardType.text,
        cardNumber: cardNum.text,
        expiryMonth: int.parse(monthExpiredDate.text),
        expiryYear: int.parse(yearExpiredDate.text),
        cvc: cvc.text,
      );
      CardController cardController = Get.find();
      cardController.addCard(newCard);
      Get.back();
    }
  }
}

class CardTypeModel {
  int index;
  String image;
  String type;

  CardTypeModel({required this.index, required this.image, required this.type});
}
