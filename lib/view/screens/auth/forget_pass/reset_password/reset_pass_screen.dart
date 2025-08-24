import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/reset_pass_controller.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/reset_password/widget/custom_reset_pass_header.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/reset_password/widget/custom_reset_pass_text_form_field.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPassController>(
      init: ResetPassController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsetsDirectional.only(
            start: 24.w,
            end: 24.w,
            bottom: 50.h,
          ),
          foregroundDecoration: BoxDecoration(
            color: controller.isLoading
                ? ColorConst.blackColor.withValues(alpha: 0.3)
                : null,
          ),
          child: CustomButton(
            txt: Strings.buttonSavePass,
            onTap: () {
              controller.submitPassword();
            },
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 24.w, end: 24.w, top: 140.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomResetPassHeader(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const CustomResetPassTextFormField(),
                  ],
                ),
              ),
            ),
            if (controller.isLoading)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: ColorConst.blackColor.withValues(alpha: 0.3),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorConst.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
