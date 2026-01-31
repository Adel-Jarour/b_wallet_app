import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.card,
    this.isTopUpScreen = false,
  });

  final CardModel card;
  final bool isTopUpScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTopUpScreen ? 78.h : 88.h,
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
            crossAxisAlignment: isTopUpScreen
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              CustomText(
                txt: card.cardType,
                fontSize: isTopUpScreen ? 12.sp : 14.sp,
                color: ColorConst.grey1Color,
              ),
              CustomText(
                txt: card.cardNumber,
                fontSize: isTopUpScreen ? 14.sp : 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          if (isTopUpScreen)
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
