import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/transaction_detail_controller.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDetailCardWidget extends StatelessWidget {
  const CustomDetailCardWidget({super.key, required this.controller});

  final TransactionDetailController controller;

  @override
  Widget build(BuildContext context) {
    final transaction = controller.transaction;

    final amountColor =
        controller.isIncome ? ColorConst.greenColor : ColorConst.blackColor;
    final headerSubtitle = controller.isIncome
        ? Strings.transactionDetailReceivedFrom
        : Strings.transactionDetailSuccessfullySentTo;

    const receiverName = 'Uncle Ng Man Tat';
    const receiverPhone = '+1-234-567';
    const note = 'Thanks for buying me the food 👌';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TotalAmountWidget(
            amountColor: amountColor,
            transaction: transaction,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipPath(
                  clipper: HalfCircleClipper(),
                  child: Container(
                    width: 16.r,
                    height: 16.r,
                    color: ColorConst.primaryColor,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 0,
                    indent: 0,
                    endIndent: 25.w,
                    color: ColorConst.grey4Color,
                    thickness: 1,
                  ),
                ),
                CustomText(
                  txt: headerSubtitle,
                  fontSize: 13.sp,
                  color: ColorConst.grey1Color,
                ),
                Expanded(
                  child: Divider(
                    height: 0,
                    indent: 25.w,
                    endIndent: 0,
                    color: ColorConst.grey4Color,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: ColorConst.grey5Color,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: receiverName,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  txt: receiverPhone,
                  fontSize: 12.sp,
                  color: ColorConst.grey1Color,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  txt: '${transaction.date} 15.46 PM',
                  fontSize: 12.sp,
                  color: ColorConst.grey1Color,
                ),
                SizedBox(height: 6.h),
                CustomText(
                  txt: note,
                  fontSize: 12.sp,
                  color: ColorConst.grey1Color,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: ColorConst.softRedColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: Strings.transactionDetailThankYou,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.whiteColor,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  txt: receiverName,
                  fontSize: 13.sp,
                  color: ColorConst.whiteColor.withValues(alpha: 0.9),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          controller.isIncome
              ? CustomButton(
                  txt: Strings.transactionDetailShare,
                  onTap: () {},
                  colorButton: Colors.transparent,
                  colorTxt: ColorConst.orangeColor,
                  boxBorder: Border.all(
                    color: ColorConst.orangeColor,
                  ),
                  height: 48.h,
                )
              : Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        txt: Strings.transactionDetailShare,
                        onTap: () {},
                        colorButton: Colors.transparent,
                        colorTxt: ColorConst.orangeColor,
                        boxBorder: Border.all(
                          color: ColorConst.orangeColor,
                        ),
                        height: 48.h,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: CustomButton(
                        txt: Strings.transactionDetailSendAgain,
                        onTap: () {},
                        height: 48.h,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _TotalAmountWidget extends StatelessWidget {
  const _TotalAmountWidget(
      {required this.amountColor, required this.transaction});

  final Color amountColor;
  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ColorConst.lightOrangeColor,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            ImageConst.cashFlowIcon,
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
          children: [
            CustomText(
              txt: Strings.transactionDetailTotalAmount,
              fontSize: 13.sp,
              color: ColorConst.grey1Color,
            ),
            SizedBox(height: 8.h),
            CustomText(
              txt: '\$${transaction.price.toStringAsFixed(2)}',
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: amountColor,
            ),
          ],
        ),
      ],
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This makes a right-side half circle (flat on left, curved on right)
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, 0)
      ..arcToPoint(
        Offset(size.width / 2, size.height),
        radius: Radius.circular(size.height / 2),
        clockwise: true,
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
