import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/home_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomHomeCategory extends StatelessWidget {
  CustomHomeCategory({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          controller.categoriesModels.length,
          (index) {
            var e = controller.categoriesModels[index];
            return Container(
              height: 72.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorConst.grey4Color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(e.icon),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomText(
                    txt: e.txt,
                    fontSize: 11.sp,
                    color: ColorConst.blackColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
