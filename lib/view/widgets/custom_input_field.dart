import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.title,
    this.icon,
    this.controller,
    this.hintText = '',
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.inputFormat,
    this.maxLength,
    this.validator,
  });

  final String title;
  final String? icon;
  final TextEditingController? controller;
  final String hintText;
  final bool readOnly;
  final Future<void> Function()? onTap;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormat;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
          fillColor: ColorConst.grey5Color,
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          onTap: onTap,
          hintTxt: hintText,
          inputFormat: inputFormat,
          maxLength: maxLength,
          validator: validator,
          suffixIcon: icon != null
              ? SvgPicture.asset(
                  icon!,
                  colorFilter: ColorFilter.mode(
                    ColorConst.grey2Color,
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
