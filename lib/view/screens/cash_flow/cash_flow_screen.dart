import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_cash_chart.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_cash_flow_header.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_cash_money_tracker.dart';
import 'package:b_wallet/view/screens/cash_flow/widget/custom_transaction_history.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CashFlowScreen extends StatelessWidget {
  CashFlowScreen({super.key});

  final CashFlowController controller = Get.put(CashFlowController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 24.w,
          end: 24.w,
          top: 60.h,
          bottom: 40.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCashFlowHeader(),
            SizedBox(
              height: 32.h,
            ),
            const CustomCashMoneyTracker(),
            SizedBox(
              height: 20.h,
            ),
            CustomCashChart(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorConst.lightGreenColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsetsDirectional.all(18),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: ColorConst.greenColor,
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Flexible(
                    child: CustomText(
                      txt: Strings.cashFlowYouDoingWellYourMoney,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorConst.greenColor,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTransactionHistory(),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              txt: Strings.buttonSeeAllTransaction,
              onTap: () {
                Get.toNamed(Routes.transactionHistory);
              },
              boxBorder: Border.all(
                color: ColorConst.orangeColor,
              ),
              colorButton: Colors.transparent,
              colorTxt: ColorConst.orangeColor,
              height: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
