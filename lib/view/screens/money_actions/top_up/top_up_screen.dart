import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/top_up_controller.dart';
import 'package:b_wallet/view/screens/money_actions/top_up/widget/custom_method_card.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_keyboard.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopUpScreen extends StatelessWidget {
  TopUpScreen({super.key});

  final TopUpController controller = Get.put(TopUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.orangeColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.homeTopUp,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 117.h,
            color: ColorConst.orangeColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: Strings.topUpEnterTheNum,
                  fontSize: 14.sp,
                  color: ColorConst.whiteColor.withValues(alpha: 0.7),
                ),
                SizedBox(
                  height: 12.h,
                ),
                GetBuilder<TopUpController>(
                  builder: (context) => CustomText(
                    txt: '\$${controller.number}.00',
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 24.w,
                end: 24.w,
                bottom: 34.h,
              ),
              child: Column(
                children: [
                  CustomKeyboard(
                    remove: () {
                      controller.removeDigit();
                    },
                    add: (String number) {
                      controller.addDigit(number);
                    },
                    isKeyWhite: false,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomMethodCard(),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    txt: Strings.buttonTopUp,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
