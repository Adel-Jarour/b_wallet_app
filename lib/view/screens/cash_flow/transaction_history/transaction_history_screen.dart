import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/models/transaction_model.dart';
import 'package:b_wallet/view/screens/cash_flow/transaction_history/widget/custom_transaction_history_app_bar_bottom.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_transaction_item.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransactionHistoryScreen extends StatelessWidget {
  TransactionHistoryScreen({super.key});

  final CashFlowController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorConst.whiteColor,
        leading: CustomArrowBack(
          color: ColorConst.grey1Color,
        ),
        title: CustomText(
          txt: Strings.cashFlowTransactionHistory,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImageConst.filterIcon,
                colorFilter: ColorFilter.mode(
                  ColorConst.grey1Color,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomTransactionHistoryAppBarBottom(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 14.w, vertical: 25.h),
          child: GetBuilder<CashFlowController>(
              id: 'transactionFilterTypeIndex',
              builder: (_) {
                List<TransactionModel> incomeList = controller.transactions
                    .where((t) => t.transactionType == TransactionType.income)
                    .toList();

                List<TransactionModel> expenseList = controller.transactions
                    .where((t) => t.transactionType == TransactionType.expense)
                    .toList();

                return controller.transactionFilterTypeIndex == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txt: Strings.transactionHistoryToday,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var transaction = controller.transactions[index];
                              return CustomTransactionItem(
                                transaction: transaction,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemCount: controller.transactions.length <= 3
                                ? controller.transactions.length
                                : 3,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomText(
                            txt: Strings.transactionHistoryYesterday,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var transaction = controller.transactions[index];
                              return CustomTransactionItem(
                                transaction: transaction,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemCount: controller.transactions.length <= 4
                                ? controller.transactions.length
                                : 4,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var transaction =
                                  controller.transactionFilterTypeIndex == 1
                                      ? incomeList[index]
                                      : expenseList[index];
                              return CustomTransactionItem(
                                transaction: transaction,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemCount:
                                controller.transactionFilterTypeIndex == 1
                                    ? incomeList.length
                                    : expenseList.length,
                          ),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
