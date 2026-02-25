import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/controller/request_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomRequestSelectCategoryBottomSheet extends StatelessWidget {
  CustomRequestSelectCategoryBottomSheet({super.key});

  final RequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: ColorConst.whiteColor,
          elevation: 0,
          builder: (_) => _CustomRequestSelectCategory(),
        );
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: ColorConst.grey5Color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => CustomText(
                txt: controller.selectedCategory.value.isEmpty
                    ? Strings.requestSelectCategory
                    : controller.selectedCategory.value,
                fontSize: 16.sp,
                color: controller.selectedCategory.value.isEmpty
                    ? ColorConst.grey2Color
                    : ColorConst.blackColor,
              ),
            ),
            SvgPicture.asset(
              ImageConst.arrowDownIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomRequestSelectCategory extends StatelessWidget {
  _CustomRequestSelectCategory();

  final RequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 0.h,
        start: 24.w,
        end: 24.w,
        bottom: 40.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4.h,
              width: 24.w,
              margin: EdgeInsetsDirectional.only(top: 16.h, bottom: 23.h),
              decoration: BoxDecoration(
                color: ColorConst.grey4Color,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
            ),
          ),
          CustomText(
            txt: Strings.requestCategory,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 24.h,
          ),
          Obx(
            () => Column(
              children: ListConst.categories.map((category) {
                return InkWell(
                  onTap: () {
                    controller.selectedCategory.value = category;
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: category,
                          groupValue: controller.selectedCategory.value,
                          onChanged: (value) {
                            controller.selectedCategory.value = value!;
                          },
                          activeColor: ColorConst.orangeColor,
                        ),
                        SizedBox(width: 10.w),
                        CustomText(
                          txt: category,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
