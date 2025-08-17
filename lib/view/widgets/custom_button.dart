import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/lottie_animations.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  final bool isLoading;
  final bool makeAnimation;
  final String? lottieAsset;
  final String? svgAsset;
  final double? width;
  final double? height;
  final Color? colorButton;
  final Color? colorTxt;
  final double borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxBorder? boxBorder;

  const CustomButton({
    super.key,
    required this.txt,
    required this.onTap,
    this.isLoading = false,
    this.makeAnimation = false,
    this.lottieAsset,
    this.svgAsset,
    this.width,
    this.height,
    this.colorButton,
    this.colorTxt,
    this.borderRadius = 8,
    this.fontSize,
    this.fontWeight,
    this.boxBorder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorButton ?? ColorConst.orangeColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
          border: boxBorder,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? _buildLoadingWidget()
              : CustomText(
                  key: const ValueKey('label'),
                  txt: txt,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  color: colorTxt ?? ColorConst.whiteColor,
                ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    if (makeAnimation) {
      return Lottie.asset(
        lottieAsset ?? LottieAnimations.loading,
        key: const ValueKey('lottie'),
        fit: BoxFit.fitHeight,
      );
    }
    return CupertinoActivityIndicator(
      key: const ValueKey('spinner'),
      color: Colors.grey.shade300,
    );
  }
}
