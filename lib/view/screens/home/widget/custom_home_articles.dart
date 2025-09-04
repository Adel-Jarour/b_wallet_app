import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeArticles extends StatelessWidget {
  const CustomHomeArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
          child: CustomText(
            txt: Strings.homeFinancialArticles,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            itemCount: 7,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: 200.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130.h,
                    decoration: BoxDecoration(
                      color: ColorConst.grey4Color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: 'Lorem ipsum dolor',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.blackColor,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      CustomText(
                        txt: 'Lorem ipsum dolor sedulur gas',
                        fontSize: 13.sp,
                        color: ColorConst.grey1Color,
                        maxLines: 1,
                      ),
                    ],
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
