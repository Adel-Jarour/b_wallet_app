import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/transaction_detail_controller.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionModel transaction = Get.arguments as TransactionModel;

    return GetBuilder<TransactionDetailController>(
      init: TransactionDetailController(transaction),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomArrowBack(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              txt: controller.isIncome
                                  ? Strings.transactionDetailMoneyReceived
                                  : Strings.requestFoodDrink,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              txt:
                                  '${Strings.transactionDetailTransactionId} ${controller.transactionId}',
                              fontSize: 12.sp,
                              color: ColorConst.whiteColor.withValues(alpha: 0.8),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 48.w),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        _TransactionCard(controller: controller),
                        SizedBox(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              txt: Strings.transactionDetailHaveIssue,
                              fontSize: 13.sp,
                              color: ColorConst.whiteColor.withValues(alpha: 0.8),
                            ),
                            SizedBox(width: 4.w),
                            CustomText(
                              txt: Strings.transactionDetailContactUs,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.whiteColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({required this.controller});

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
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
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
          SizedBox(height: 16.h),
          CustomText(
            txt: headerSubtitle,
            fontSize: 13.sp,
            color: ColorConst.grey1Color,
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

