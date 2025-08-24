import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/forget_pass_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/otp/widget/custom_otp_header.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      bottomNavigationBar: GetBuilder<ForgetPassController>(
        id: 'otp',
        builder: (controller) => controller.showContinueButton
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 24.w,
                  end: 24.w,
                  bottom: 50.h,
                ),
                child: CustomButton(
                  txt: Strings.buttonContinue,
                  onTap: () {
                    Get.toNamed(Routes.resetPass);
                  },
                ),
              )
            : const SizedBox(),
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
                const CustomOtpHeader(),
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
  );
}
