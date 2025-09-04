import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCashFlowHeader extends StatelessWidget {
  const CustomCashFlowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.r),
      decoration: BoxDecoration(
        color: ColorConst.primaryColor,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(ImageConst.homeAppBarWave),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            txt: Strings.cashFlowCurrentBalance,
            color: ColorConst.lightBlueColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            txt: '\$500,000,000.00',
            color: ColorConst.whiteColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 68.h,
                  decoration: BoxDecoration(
                    color: ColorConst.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        txt: Strings.cashFlowIncome,
                        color: ColorConst.grey1Color,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        txt: '+\$10,000,000',
                        color: ColorConst.greenColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Container(
                  height: 68.h,
                  decoration: BoxDecoration(
                    color: ColorConst.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        txt: Strings.cashFlowExpense,
                        color: ColorConst.grey1Color,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        txt: '-\$3,000,000',
                        color: ColorConst.softRedColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
