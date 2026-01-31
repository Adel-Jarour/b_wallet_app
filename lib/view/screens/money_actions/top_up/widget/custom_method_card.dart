import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/top_up_controller.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/screens/money_actions/top_up/widget/custom_bottom_sheet_card.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomMethodCard extends StatelessWidget {
  CustomMethodCard({super.key});

  final TopUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          CustomBottomSheetCard(),
        );
      },
      child: GetBuilder<TopUpController>(
        builder: (_) => (controller.selectedMethod != null)
            ? _CardSelected(card: controller.cards[controller.selectedMethod!])
            : const _NoCardSelected(),
      ),
    );
  }
}

class _NoCardSelected extends StatelessWidget {
  const _NoCardSelected();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorConst.grey3Color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: Strings.topUpMethodCard + Strings.topUpMethodNoCard,
                fontSize: 12.sp,
                color: ColorConst.grey1Color,
              ),
              CustomText(
                txt: Strings.topUpPleaseChooseYourCard,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.blackColor,
              ),
            ],
          ),
          SvgPicture.asset(
            ImageConst.arrowNextIcon,
            colorFilter: ColorFilter.mode(
              ColorConst.grey2Color,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardSelected extends StatelessWidget {
  const _CardSelected({
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorConst.grey3Color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            card.image,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: Strings.topUpMethodCard + card.cardType,
                fontSize: 12.sp,
                color: ColorConst.grey1Color,
              ),
              CustomText(
                txt: card.cardNumber,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.blackColor,
              ),
            ],
          ),
          SvgPicture.asset(
            ImageConst.arrowDownIcon,
            colorFilter: ColorFilter.mode(
              ColorConst.grey2Color,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
