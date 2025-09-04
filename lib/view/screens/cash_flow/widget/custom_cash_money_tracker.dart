import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCashMoneyTracker extends StatelessWidget {
  const CustomCashMoneyTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          txt: Strings.cashFlowMoneyTracker,
          color: ColorConst.blackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorConst.grey3Color,
            ),
          ),
          padding: EdgeInsetsDirectional.only(start: 12.w, end: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                txt: 'weekly',
                color: ColorConst.blackColor,
                fontSize: 14.sp,
              ),
              SizedBox(
                width: 20.w,
              ),
              SvgPicture.asset(ImageConst.arrowDownIcon)
            ],
          ),
        ),
      ],
    );
  }
}
