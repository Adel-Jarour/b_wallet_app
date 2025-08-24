import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomResetPassHeader extends StatelessWidget {
  const CustomResetPassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 80.r,
          height: 80.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.lightBlue2Color,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(ImageConst.emailIcon),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomText(
          txt: Strings.resetPass,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 9.h,
        ),
        CustomText(
          txt: Strings.resetPassMsg,
          fontSize: 14.sp,
          color: ColorConst.blackColor.withValues(alpha: 0.7),
        )
      ],
    );
  }
}
