import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNumberOfSendBottomSheet extends StatelessWidget {
  const CustomNumberOfSendBottomSheet({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.h,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConst.grey3Color,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: ColorConst.orangeColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageConst.requestIcon),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                txt: Strings.requestNumTheRequests,
                color: ColorConst.grey1Color,
                fontSize: 14.sp,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                txt: '\$$number.00',
                color: ColorConst.orangeColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
