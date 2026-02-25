import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/controller/send_controller.dart';
import 'package:b_wallet/view/screens/money_actions/send/widget/custom_send_bottom_sheet.dart';
import 'package:b_wallet/view/screens/money_actions/send/widget/custom_send_header_widget.dart';
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
          CustomSendHeaderWidget(),
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
                      onTap: () {
                        if (controller.correctSend) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: ColorConst.whiteColor,
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.9,
                              minHeight:
                                  MediaQuery.of(context).size.height * 0.9,
                            ),
                            elevation: 0,
                            builder: (_) => CustomSendBottomSheet(),
                          );
                        }
                      },
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
