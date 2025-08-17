import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomForgetPassMethod extends StatelessWidget {
  const CustomForgetPassMethod({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.desc,
    required this.chooseMethod,
  });

  final String icon;
  final String title;
  final String desc;
  final bool chooseMethod;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 12.h,
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                chooseMethod ? ColorConst.primaryColor : ColorConst.grey3Color,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: ColorConst.blackColor.withValues(alpha: 0.09),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 33.r,
              height: 30.r,
              colorFilter: ColorFilter.mode(
                ColorConst.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    txt: title,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    txt: desc,
                    fontSize: 13.sp,
                    height: 1.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
