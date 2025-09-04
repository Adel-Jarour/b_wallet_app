import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/add_new_card_controller.dart';
import 'package:b_wallet/view/screens/profile/add_new_card/widget/custom_drop_down_text_field.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomExpDateField extends StatelessWidget {
  CustomExpDateField({
    super.key,
  });

  final AddNewCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropDownTextField(
            title: Strings.addCardExpiredDate,
            hintText: Strings.textFieldMonth,
            controller: controller.monthExpiredDate,
            onChange: (value) {
              if (value != null) {
                controller.monthExpiredDate.text = value;
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.errorPleaseSelectMonth;
              }
              return null;
            },
            items: [
              ...controller.months.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: CustomText(
                    txt: e,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: CustomDropDownTextField(
            title: '',
            hintText: Strings.textFieldYear,
            controller: controller.yearExpiredDate,
            onChange: (value) {
              if (value != null) {
                controller.yearExpiredDate.text = value;
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.errorPleaseSelectYear;
              }
              return null;
            },
            items: [
              ...controller.years.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: CustomText(
                    txt: e,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
