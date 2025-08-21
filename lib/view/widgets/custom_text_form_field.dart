import 'package:b_wallet/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hintTxt;
  final String? label;
  final String? errorTxt;
  final FocusNode? focusNode;
  final String? prefix;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onPressedPrefixIcon;
  final Function? validator;
  final Function? onEditingComplete;
  final Function? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? obscureText;
  final bool? prefixVisible;
  final bool? enabled;
  final bool autofocus;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? prefixScale;
  final double? hintFontSize;
  final TextDirection? textDirection;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    this.title,
    this.hintTxt,
    this.label,
    this.onPressedPrefixIcon,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.prefixIconColor,
    this.suffixIconColor,
    this.enabled = true,
    this.initialValue,
    this.prefix,
    this.focusNode,
    this.prefixScale,
    this.prefixVisible = true,
    this.textDirection = TextDirection.rtl,
    this.autofocus = false,
    this.hintFontSize,
    this.onEditingComplete,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.onChanged,
    this.errorTxt,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (onTap != null) ? onTap!() : null,
      focusNode: focusNode,
      autofocus: autofocus,
      initialValue: initialValue,
      controller: controller,
      validator: (value) => validator!(value),
      onEditingComplete: () => onEditingComplete,
      onTapOutside: (x) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (onChanged != null) ? (String value) => onChanged : null,
      minLines: minLines,
      maxLines: maxLines,
      readOnly: readOnly,
      maxLength: maxLength,
      cursorColor: ColorConst.primaryColor,
      style: TextStyle(
        fontFamily: "Inter_18pt",
        color: context.isDarkMode ? Colors.white : Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintTxt?.tr ?? "",
        hintStyle: TextStyle(
          fontFamily: "Inter_18pt",
          color: ColorConst.grey2Color,
          fontSize: hintFontSize ?? 12.sp,
        ),
        labelText: label?.tr,
        labelStyle: TextStyle(
          fontFamily: "Inter_18pt",
          color: Colors.grey,
          fontSize: 15.sp,
        ),
        errorStyle: TextStyle(
          fontFamily: "Inter_18pt",
          color: ColorConst.redColor,
          fontSize: 11.sp,
        ),
        errorText: errorTxt,
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConst.grey3Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConst.grey3Color),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConst.softRedColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.isDarkMode ? Colors.red : Colors.red,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConst.grey3Color),
        ),
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        prefixIcon: (prefixIcon != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, end: 20.w),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: BoxConstraints(
          minHeight: 20.h,
          minWidth: 17.w,
        ),
        suffixIcon: (suffixIcon != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(end: 22.w),
                child: suffixIcon,
              )
            : null,
        suffixIconColor: suffixIconColor ?? Colors.white,
        prefixIconColor: prefixIconColor ?? Colors.white,
      ),
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText!,
    );
  }
}
