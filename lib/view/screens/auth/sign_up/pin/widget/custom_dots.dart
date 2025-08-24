import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/pin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          bool filled = index < controller.pin.length;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            width: 16.r,
            height: 16.r,
            decoration: BoxDecoration(
              color: filled ? ColorConst.whiteColor : ColorConst.darkBlueColor,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}
