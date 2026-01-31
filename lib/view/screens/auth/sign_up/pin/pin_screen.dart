import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/pin_controller.dart';
import 'package:b_wallet/view/screens/auth/sign_up/pin/widget/custom_dots.dart';
import 'package:b_wallet/view/widgets/custom_keyboard.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PinScreen extends StatelessWidget {
  PinScreen({super.key});

  final PinController controller = Get.put(PinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 132.h,
          start: 24.w,
          end: 24.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              txt: Strings.pinTitle,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorConst.whiteColor,
            ),
            SizedBox(height: 8.h),
            CustomText(
              txt: Strings.pinMsg,
              fontSize: 14.sp,
              color: ColorConst.whiteColor.withValues(alpha: 0.7),
              height: 1.3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            const CustomDots(),
            SizedBox(height: 60.h),
            CustomKeyboard(
              remove: controller.removeDigit,
              add: (String number) {
                controller.addDigit(number);
              },
            ),
          ],
        ),
      ),
    );
  }
}
