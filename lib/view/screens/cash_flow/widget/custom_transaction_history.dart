import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_transaction_item.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTransactionHistory extends StatelessWidget {
  CustomTransactionHistory({super.key});

  final CashFlowController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: Strings.cashFlowTransactionHistory,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 18.h,
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
      ],
    );
  }
}
