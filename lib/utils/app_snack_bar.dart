import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showErrorRawSnackBar({
    required String message,
  }) {
    Get.rawSnackbar(
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: ColorConst.redColor,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        Icons.error_outlined,
        color: ColorConst.whiteColor,
        size: 24.r,
      ),
      shouldIconPulse: false,
      messageText: CustomText(
        txt: message,
        fontSize: 16.sp,
        color: ColorConst.whiteColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      borderRadius: 8,
      barBlur: 0,
    );
  }

  static void showSuccessRawSnackBar({
    required String message,
  }) {
    Get.rawSnackbar(
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        Icons.check_circle_outline,
        color: ColorConst.whiteColor,
        size: 24.r,
      ),
      messageText: CustomText(
        txt: message,
        fontSize: 16.sp,
        color: ColorConst.whiteColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      borderRadius: 8,
      barBlur: 0,
    );
  }
}
