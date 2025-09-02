import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/card_controller.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class CustomCardItem extends StatelessWidget {
  CustomCardItem({
    super.key,
  });

  final CardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            CardModel card = controller.cards[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: _cardItem(card: card),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: ColorConst.grey4Color,
            height: 32.h,
            thickness: 1,
          ),
          itemCount: controller.cards.length,
        ),
      ),
    );
  }

  Widget _cardItem({required CardModel card}) {
    return Container(
      height: 88.h,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                txt: card.cardType,
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
        ],
      ),
    );
  }
}
