import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLoginFormField extends StatelessWidget {
  const CustomLoginFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(label: Strings.textFieldEmail),
        SizedBox(height: 20.h),
        GetBuilder<AuthController>(
          builder: (controller) => CustomTextFormField(
            label: Strings.textFieldPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.updateShowPass();
              },
              child: Icon(
                controller.showPass ? Icons.visibility : Icons.visibility_off,
                color: ColorConst.grey2Color,
              ),
            ),
            obscureText: controller.showPass,
          ),
        ),
      ],
    );
  }
}
