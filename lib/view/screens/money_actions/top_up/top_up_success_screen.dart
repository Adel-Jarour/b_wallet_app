import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/lottie_animations.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/screens/money_actions/top_up/widget/custom_top_up_success_bottom_sheet.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class TopUpSuccessScreen extends StatelessWidget {
  TopUpSuccessScreen({super.key});

  final Map<String, dynamic> info = Get.arguments;

  @override
  Widget build(BuildContext context) {
    CardModel card = info['card'];
    String num = info['number'];
    return Scaffold(
      backgroundColor: ColorConst.orangeColor,
      bottomSheet: CustomTopUpSuccessBottomSheet(
        num: num,
        card: card,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 108.h),
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                LottieAnimations.successCheckWhite,
                height: 180.h,
                width: 180.w,
                repeat: true,
                backgroundLoading: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                txt: Strings.topUpSuccessMsg,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
