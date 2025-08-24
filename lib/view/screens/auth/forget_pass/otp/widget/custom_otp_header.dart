import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOtpHeader extends StatelessWidget {
  const CustomOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.r,
          height: 80.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.whiteColor.withValues(alpha: 0.1),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(ImageConst.lockIcon),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomText(
          txt: Strings.otpTitle,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        SizedBox(
          height: 7.h,
        ),
        CustomText(
          txt: Strings.otpDesc,
          fontSize: 14.sp,
          color: ColorConst.whiteColor.withValues(alpha: 0.7),
        ),
        SizedBox(
          height: 9.h,
        ),
        CustomText(
          txt: '08768262427',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorConst.whiteColor,
        )
      ],
    );
  }
}
