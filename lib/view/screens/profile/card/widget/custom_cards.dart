import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/card_controller.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/screens/profile/widget/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class CustomCards extends StatelessWidget {
  CustomCards({
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
                  child: CustomCardItem(card: card),
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
}
