import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTransactionHistoryAppBarBottom extends StatelessWidget {
  CustomTransactionHistoryAppBarBottom({
    super.key,
  });

  final CashFlowController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashFlowController>(
      id: 'transactionFilterTypeIndex',
      builder: (_) => Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 14.w),
          child: Row(
            children: controller.transactionFilterType.map((e) {
              bool check = controller.transactionFilterTypeIndex == e.$1;
              return Padding(
                padding: EdgeInsetsDirectional.only(end: e.$1 == 2 ? 0 : 8.w),
                child: InkWell(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  onTap: () {
                    controller.updateTransactionFilterTypeIndex(e.$1);
                  },
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: check
                          ? ColorConst.lightOrangeColor
                          : Colors.transparent,
                      border: Border.all(
                        color: check
                            ? ColorConst.orangeColor
                            : ColorConst.grey3Color,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      txt: e.$2,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: check
                          ? ColorConst.orangeColor
                          : ColorConst.grey2Color,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
