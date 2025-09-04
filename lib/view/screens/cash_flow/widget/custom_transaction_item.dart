import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTransactionItem extends StatelessWidget {
  const CustomTransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: ColorConst.grey5Color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.h),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorConst.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsetsDirectional.symmetric(vertical: 4.h),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  ImageConst.percentIcon,
                  colorFilter:
                      ColorFilter.mode(ColorConst.orangeColor, BlendMode.srcIn),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: 'Cashback Promo',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    txt: '1 Jan 2020',
                    fontSize: 12.sp,
                    color: ColorConst.grey1Color,
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            txt: '+\$16,000',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorConst.greenColor,
          ),
        ],
      ),
    );
  }
}
