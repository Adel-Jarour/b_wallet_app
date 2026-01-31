import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSplashHeader extends StatelessWidget {
  CustomSplashHeader({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment:
          controller.showBottomSheet ? Alignment.topCenter : Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: controller.showBottomSheet ? 100.h : 0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 12),
                    blurRadius: 32,
                    spreadRadius: 0,
                    color: ColorConst.blackColor.withValues(alpha: 0.1),
                  ),
                ],
              ),
              child: Image.asset(ImageConst.logoApp),
            ),
            SizedBox(height: 20.h),
            CustomText(
              txt: Strings.appName,
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: ColorConst.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
