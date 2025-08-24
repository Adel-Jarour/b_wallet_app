import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/reset_pass_controller.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomResetPassTextFormField extends StatelessWidget {
  const CustomResetPassTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPassController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextFormField(
            label: Strings.textFieldNewPassword,
            controller: controller.newPassController,
            errorTxt: controller.confirmError,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.updateShowNewPass();
              },
              child: Icon(
                controller.showNewPass
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 25.sp,
                color: ColorConst.grey2Color,
              ),
            ),
            obscureText: controller.showNewPass,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFormField(
            label: Strings.textFieldConfirmNewPassword,
            controller: controller.confirmPassController,
            errorTxt: controller.confirmError,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.updateShowConfirmPass();
              },
              child: Icon(
                controller.showConfirmPass
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 25.sp,
                color: ColorConst.grey2Color,
              ),
            ),
            obscureText: controller.showConfirmPass,
          )
        ],
      ),
    );
  }
}
