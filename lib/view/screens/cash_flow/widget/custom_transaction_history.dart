import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_transaction_item.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTransactionHistory extends StatelessWidget {
  const CustomTransactionHistory({super.key});

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
        CustomTransactionItem(),
      ],
    );
  }
}
