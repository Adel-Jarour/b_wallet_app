import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/send_controller.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_keyboard.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendScreen extends StatelessWidget {
  SendScreen({super.key});

  final SendController controller = Get.put(SendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.purpleColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.homeSend,
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
            padding: EdgeInsetsDirectional.only(top: 25.h, bottom: 30.h),
            color: ColorConst.purpleColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: Strings.sendEnterTheSend,
                  fontSize: 14.sp,
                  color: ColorConst.whiteColor.withValues(alpha: 0.7),
                ),
                SizedBox(
                  height: 12.h,
                ),
                GetBuilder<SendController>(
                  builder: (context) => CustomText(
                    txt: '\$${controller.number}.00',
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.whiteColor,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                      start: 24.w,
                      end: 24.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.selectFromSuggested(
                              controller.suggestedNumbers[index]);
                        },
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConst.whiteColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            txt: "\$ ${controller.suggestedNumbers[index]}.00",
                            color: ColorConst.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 12.w,
                      );
                    },
                    itemCount: 5,
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
                  GetBuilder<SendController>(
                    builder: (_) => CustomButton(
                      txt: Strings.buttonContinue,
                      colorButton: controller.correctSend
                          ? ColorConst.orangeColor
                          : ColorConst.grey4Color,
                      colorTxt: controller.correctSend
                          ? ColorConst.whiteColor
                          : ColorConst.grey2Color,
                      onTap: controller.submitSend,
                    ),
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
