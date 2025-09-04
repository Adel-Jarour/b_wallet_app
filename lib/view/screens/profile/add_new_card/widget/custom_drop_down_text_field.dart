import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.title,
    this.controller,
    this.hintText = '',
    this.items,
    this.validator,
    this.onChange,
  });

  final String title;
  final TextEditingController? controller;
  final List<DropdownMenuItem<String>>? items;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;

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
        DropdownButtonFormField(
          icon: const SizedBox.shrink(),
          hint: CustomText(
            txt: hintText,
            fontFamily: "Inter_18pt",
            color: ColorConst.grey2Color,
            fontSize: 12.sp,
          ),
          style: TextStyle(
            fontFamily: "Inter_18pt",
            color: ColorConst.blackColor,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorConst.grey5Color,
            errorStyle: TextStyle(
              fontFamily: "Inter_18pt",
              color: ColorConst.redColor,
              fontSize: 11.sp,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConst.softRedColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConst.redColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConst.grey3Color),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 23.w),
              child: SvgPicture.asset(
                ImageConst.arrowDownIcon,
                colorFilter: ColorFilter.mode(
                  ColorConst.grey2Color,
                  BlendMode.srcIn,
                ),
              ),
            ),
            suffixIconConstraints: BoxConstraints(maxWidth: 40.w),
          ),
          dropdownColor: ColorConst.whiteColor,
          items: items,
          onChanged: onChange,
          validator: validator,
        ),
      ],
    );
  }
}
