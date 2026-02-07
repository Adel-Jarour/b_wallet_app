import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/security_pin_controller.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_keyboard.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecurityPinScreen extends StatelessWidget {
  SecurityPinScreen({super.key});

  final SecurityPinController controller = Get.put(SecurityPinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: controller.appBarTitle ?? '',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 32.h,
          start: 24.w,
          end: 24.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              txt: Strings.securityPinEnterSecurityPin,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorConst.whiteColor,
            ),
            SizedBox(height: 8.h),
            CustomText(
              txt: Strings.securityPinMsg,
              fontSize: 14.sp,
              color: ColorConst.whiteColor.withValues(alpha: 0.7),
              height: 1.4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            const CustomSecurityPinDots(),
            SizedBox(height: 28.h),
            CustomText(
              txt: Strings.securityPinForgetPin,
              fontSize: 14.sp,
              color: ColorConst.whiteColor,
            ),
            SizedBox(height: 35.h),
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

class CustomSecurityPinDots extends StatelessWidget {
  const CustomSecurityPinDots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecurityPinController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          bool filled = index < controller.pin.length;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            width: 16.r,
            height: 16.r,
            decoration: BoxDecoration(
              color: filled ? ColorConst.whiteColor : ColorConst.darkBlueColor,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}
