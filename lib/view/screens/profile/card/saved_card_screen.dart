import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/card_controller.dart';
import 'package:b_wallet/view/screens/profile/card/widget/custom_card_item.dart';
import 'package:b_wallet/view/screens/profile/widget/custom_profile_setting.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedCardScreen extends StatelessWidget {
  SavedCardScreen({super.key});

  final CardController controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.profileSavedCard,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 32.h,
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            GetBuilder<CardController>(
              builder: (_) => controller.cards.isEmpty
                  ? const SizedBox()
                  : CustomCardItem(),
            ),
            SizedBox(
              height: controller.cards.isEmpty ? 0 : 24.h,
            ),
            CustomProfileSetting(
              item: controller.addCardItem,
            ),
          ],
        ),
      ),
    );
  }
}
