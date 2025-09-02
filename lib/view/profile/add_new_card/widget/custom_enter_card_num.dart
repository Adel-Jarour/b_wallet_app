import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/add_new_card_controller.dart';
import 'package:b_wallet/view/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomEnterCardNum extends StatelessWidget {
  CustomEnterCardNum({super.key});

  final AddNewCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      title: Strings.addCardCardNumber,
      hintText: '**** **** **** ****',
      controller: controller.cardNum,
      maxLength: 19,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.errorPleaseEnterCardNum;
        }
        String digits = value.replaceAll(' ', '');
        if (digits.length != 16) {
          return Strings.errorCardNumMust16Digits;
        }
        return null;
      },
      inputFormat: [
        FilteringTextInputFormatter.digitsOnly,
        CardNumberFormatter(),
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(' ', '');

    String newString = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      newString += digitsOnly[i];
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) {
        newString += ' ';
      }
    }

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
