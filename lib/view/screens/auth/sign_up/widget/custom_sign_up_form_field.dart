import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpFormField extends StatelessWidget {
  const CustomSignUpFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(label: Strings.textFieldName),
        SizedBox(height: 20.h),
        const CustomTextFormField(label: Strings.textFieldPhoneNum),
        SizedBox(height: 20.h),
        const CustomTextFormField(label: Strings.textFieldEmailAddress),
        SizedBox(height: 20.h),
        const CustomTextFormField(label: Strings.textFieldBirthday),
        SizedBox(height: 20.h),
        CustomTextFormField(
          label: Strings.textFieldPassword,
          suffixIcon: Icon(
            Icons.visibility_off,
            color: ColorConst.grey2Color,
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
