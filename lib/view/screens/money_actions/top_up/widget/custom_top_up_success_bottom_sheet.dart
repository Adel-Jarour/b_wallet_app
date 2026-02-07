import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomTopUpSuccessBottomSheet extends StatelessWidget {
  const CustomTopUpSuccessBottomSheet({
    super.key,
    required this.num,
    required this.card,
  });

  final CardModel card;
  final String num;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: ColorConst.whiteColor,
      builder: (context) {
        return Container(
          padding: EdgeInsetsDirectional.only(
            top: 24.h,
            start: 24.w,
            end: 24.w,
            bottom: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _customInfoContainer(
                icon: ImageConst.amountIcon,
                title: Strings.topUpSuccessTotalAmount,
                amount: num,
              ),
              SizedBox(
                height: 16.h,
              ),
              _customInfoContainer(
                icon: ImageConst.balanceIcon,
                title: Strings.topUpSuccessYourBalance,
                amount: "5000",
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 88.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConst.grey3Color,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(card.image),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        txt: 'Method - ${card.cardType}',
                        fontSize: 14.sp,
                        color: ColorConst.grey1Color,
                      ),
                      CustomText(
                        txt: card.cardNumber,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomButton(
                txt: Strings.buttonOk,
                onTap: () {
                  Get.offNamedUntil(
                    Routes.topUp,
                    (route) => route.settings.name == Routes.home,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _customInfoContainer({
  required String icon,
  required String title,
  required String amount,
}) {
  return Container(
    height: 56.h,
    padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorConst.grey3Color,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    alignment: Alignment.center,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        icon,
      ),
      title: CustomText(
        txt: title,
        fontSize: 16.sp,
      ),
      trailing: CustomText(
        txt: '\$$amount.00',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
