import 'package:b_wallet/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDragHandle extends StatelessWidget {
  const CustomDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 4.h,
      margin: EdgeInsets.only(
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConst.grey3Color,
      ),
    );
  }
}
