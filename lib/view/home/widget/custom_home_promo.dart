import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomePromo extends StatelessWidget {
  const CustomHomePromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
          child: CustomText(
            txt: Strings.homePromoForYou,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 96.h,
          child: ListView.separated(
            itemCount: 5,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: 280.w,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
                vertical: 26.h,
              ),
              decoration: BoxDecoration(
                color: ColorConst.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: 'Doorprice Handphone',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.whiteColor,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      CustomText(
                        txt: 'Get coupons now',
                        fontSize: 12.sp,
                        color: ColorConst.whiteColor,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.image,
                    color: ColorConst.whiteColor,
                    size: 30.r,
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 16.w,
            ),
          ),
        ),
      ],
    );
  }
}
