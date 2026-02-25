import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/controller/send_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSendHeaderWidget extends StatelessWidget {
  CustomSendHeaderWidget({super.key});

  final SendController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(top: 25.h, bottom: 30.h),
      color: ColorConst.purpleColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            txt: Strings.sendEnterTheSend,
            fontSize: 14.sp,
            color: ColorConst.whiteColor.withValues(alpha: 0.7),
          ),
          SizedBox(
            height: 12.h,
          ),
          GetBuilder<SendController>(
            builder: (context) => CustomText(
              txt: '\$${controller.number}.00',
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.whiteColor,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(
                start: 24.w,
                end: 24.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller
                        .selectFromSuggested(ListConst.suggestedNumbers[index]);
                  },
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConst.whiteColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      txt: "\$ ${ListConst.suggestedNumbers[index]}.00",
                      color: ColorConst.whiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.w,
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
