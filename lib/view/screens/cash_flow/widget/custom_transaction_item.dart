import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:b_wallet/view/screens/cash_flow/transaction_detail/transaction_detail_screen.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomTransactionItem extends StatelessWidget {
  const CustomTransactionItem({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const TransactionDetailScreen(),
          arguments: transaction,
        );
      },
      child: Container(
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
                    transaction.icon,
                    colorFilter: ColorFilter.mode(
                      ColorConst.orangeColor,
                      BlendMode.srcIn,
                    ),
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
                      txt: transaction.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      txt: transaction.date,
                      fontSize: 12.sp,
                      color: ColorConst.grey1Color,
                    ),
                  ],
                ),
              ],
            ),
            CustomText(
              txt: transaction.transactionType == TransactionType.income
                  ? '+\$${transaction.price}'
                  : '-\$${transaction.price}',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: transaction.transactionType == TransactionType.income
                  ? ColorConst.greenColor
                  : ColorConst.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
