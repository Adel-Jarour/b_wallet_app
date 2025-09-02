import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/add_new_card_controller.dart';
import 'package:b_wallet/view/profile/add_new_card/widget/custom_drop_down_text_field.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSelectCardType extends StatelessWidget {
  CustomSelectCardType({super.key});

  final AddNewCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomDropDownTextField(
      title: Strings.addCardChooseCard,
      hintText: Strings.textFieldChoose,
      controller: controller.cardType,
      onChange: (value) {
        if (value != null) {
          int index = controller.cardTypes.indexWhere((e) => e.type == value);
          controller.updateSelectedCardTypeIndex(index);
          controller.cardType.text = value;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.errorPleaseSelectCardType;
        }
        return null;
      },
      items: [
        ...List.generate(
          controller.cardTypes.length,
          (index) {
            var cardType = controller.cardTypes[index];
            return DropdownMenuItem(
              value: cardType.type,
              child: Row(
                children: [
                  Image.asset(
                    cardType.image,
                    width: 45.w,
                    height: 45.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    txt: cardType.type,
                    fontSize: 15.sp,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
