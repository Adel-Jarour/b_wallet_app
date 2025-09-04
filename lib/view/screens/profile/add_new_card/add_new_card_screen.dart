import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/add_new_card_controller.dart';
import 'package:b_wallet/view/screens/profile/add_new_card/widget/custom_enter_card_num.dart';
import 'package:b_wallet/view/screens/profile/add_new_card/widget/custom_exp_date_field.dart';
import 'package:b_wallet/view/screens/profile/add_new_card/widget/custom_select_card_type.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_input_field.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({super.key});

  final AddNewCardController controller = Get.put(AddNewCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.buttonAddNewCard,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 30.h),
        child: CustomButton(
          txt: Strings.buttonSaveCard,
          onTap: () {
            controller.submitSaveCard();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomSelectCardType(),
                SizedBox(
                  height: 24.h,
                ),
                CustomEnterCardNum(),
                SizedBox(
                  height: 24.h,
                ),
                CustomExpDateField(),
                SizedBox(
                  height: 24.h,
                ),
                CustomInputField(
                  title: Strings.addCardCVC,
                  icon: ImageConst.helpIcon,
                  controller: controller.cvc,
                  hintText: '000',
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Strings.errorPleaseEnterCVC;
                    }
                    if (value.length != 3) return Strings.errorCVCMust3Digits;
                    return null;
                  },
                  inputFormat: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
