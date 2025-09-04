import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNoNotificationReceived extends StatelessWidget {
  const CustomNoNotificationReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorConst.grey4Color,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            ImageConst.notifyIcon,
            width: 27.w,
            height: 34.h,
            colorFilter: ColorFilter.mode(
              ColorConst.grey2Color,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomText(
            txt: Strings.notificationNoReceived,
            fontSize: 16.sp,
            textAlign: TextAlign.center,
            height: 1.3,
          ),
        ],
      ),
    );
  }
}
