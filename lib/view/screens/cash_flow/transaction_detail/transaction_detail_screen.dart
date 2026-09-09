import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/transaction_detail_controller.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:b_wallet/view/screens/cash_flow/transaction_detail/widget/custom_detail_card_widget.dart';
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
          appBar: AppBar(
            leading: const CustomArrowBack(),
            backgroundColor: ColorConst.primaryColor,
            elevation: 0,
          ),
          backgroundColor: ColorConst.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 13.sp,
                        color: ColorConst.whiteColor.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: Column(
                      children: [
                        CustomDetailCardWidget(controller: controller),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        txt: Strings.transactionDetailHaveIssue,
                        fontSize: 14.sp,
                        color: ColorConst.lightBlueColor.withValues(alpha: 0.8),
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        txt: Strings.transactionDetailContactUs,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.oceanBlueColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
