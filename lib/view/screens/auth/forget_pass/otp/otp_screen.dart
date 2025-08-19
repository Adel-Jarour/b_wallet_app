import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/forget_pass_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(ImageConst.waves),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConst.whiteColor.withValues(alpha: 0.1),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(ImageConst.lockIcon),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomText(
                  txt: Strings.otpTitle,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.whiteColor,
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomText(
                  txt: Strings.otpDesc,
                  fontSize: 14.sp,
                  color: ColorConst.whiteColor.withValues(alpha: 0.7),
                ),
                SizedBox(
                  height: 9.h,
                ),
                CustomText(
                  txt: '08768262427',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.whiteColor,
                ),
                SizedBox(
                  height: 66.h,
                ),
                buildPinPut(),
                SizedBox(
                  height: 35.h,
                ),
                GetBuilder<ForgetPassController>(
                  id: 'otp',
                  builder: (controller) => controller.checkOtp
                      ? CircularProgressIndicator(
                          color: ColorConst.whiteColor,
                        )
                      : controller.showContinueButton
                          ? Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 70.w),
                              child: CustomButton(
                                txt: Strings.buttonContinue,
                                onTap: () {
                                  Get.toNamed(Routes.resetPass);
                                },
                              ),
                            )
                          : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPinPut() {
  final ForgetPassController controller = Get.find();

  final defaultPinTheme = PinTheme(
    width: 64.w,
    height: 64.h,
    textStyle: TextStyle(
      fontSize: 24.sp,
      color: ColorConst.whiteColor,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: ColorConst.whiteColor),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(
      color: ColorConst.whiteColor,
    ),
    borderRadius: BorderRadius.circular(16),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Colors.transparent,
    ),
  );

  return Pinput(
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: focusedPinTheme,
    submittedPinTheme: submittedPinTheme,
    validator: (s) {
      controller.verifyOtp(s!);
      return null;
    },
    errorText: '',
    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    showCursor: true,
    onCompleted: (pin) => print(pin),
  );
}
