import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/top_up_controller.dart';
import 'package:b_wallet/models/card_model.dart';
import 'package:b_wallet/view/screens/profile/widget/custom_profile_setting.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheetCard extends StatelessWidget {
  CustomBottomSheetCard({super.key});

  final TopUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: ColorConst.whiteColor,
      builder: (context) {
        return Container(
          padding: EdgeInsetsDirectional.only(
            top: 16.h,
            start: 24.w,
            end: 24.w,
            bottom: 14.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 24.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: ColorConst.grey3Color,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                txt: Strings.topUpChooseTopUpMethod,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.blackColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  CardModel card = controller.cards[index];
                  return InkWell(
                    onTap: () {
                      controller.onChangeSelectedMethod(card.id);
                    },
                    child: Container(
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
                                txt: card.cardType,
                                fontSize: 12.sp,
                                color: ColorConst.grey1Color,
                              ),
                              CustomText(
                                txt: card.cardNumber,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          GetBuilder<TopUpController>(
                            builder: (_) => Radio(
                              value: card.id,
                              groupValue: controller.selectedMethod,
                              onChanged: controller.onChangeSelectedMethod,
                              focusColor: ColorConst.orangeColor,
                              activeColor: ColorConst.orangeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
                itemCount: controller.cards.length,
              ),
              CustomProfileSetting(
                item: controller.addCardItem,
                buttonColor: ColorConst.grey5Color,
              ),
            ],
          ),
        );
      },
    );
  }
}
