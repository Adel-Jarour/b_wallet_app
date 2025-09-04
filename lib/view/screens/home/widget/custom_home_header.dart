import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/home_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomHomeHeader extends StatelessWidget {
  CustomHomeHeader({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 239.h,
      child: Stack(
        children: [
          const CustomHomeHeaderBalance(),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              height: 100.h,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: ColorConst.whiteColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                    spreadRadius: 0,
                    color: ColorConst.blackColor.withValues(alpha: 0.05),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  controller.headerModels.length,
                  (index) {
                    var e = controller.headerModels[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: e.color,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(e.icon),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomText(
                          txt: e.txt,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.blackColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHomeHeaderBalance extends StatelessWidget {
  const CustomHomeHeaderBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsetsDirectional.only(
        top: 0.h,
        start: 24.w,
        end: 24.w,
      ),
      margin: EdgeInsetsDirectional.only(bottom: 52.h),
      decoration: BoxDecoration(
        color: ColorConst.primaryColor,
        image: DecorationImage(
          image: AssetImage(ImageConst.homeAppBarWave),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                txt: Strings.homeBalance,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorConst.whiteColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              GetBuilder<HomeController>(
                builder: (controller) => Row(
                  children: [
                    controller.showBalance
                        ? CustomText(
                            txt: '\$ 5000',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.whiteColor,
                          )
                        : Row(
                            children: List.generate(
                              5,
                              (index) => Container(
                                width: 8.r,
                                height: 8.r,
                                margin: EdgeInsetsDirectional.only(end: 5.w),
                                decoration: BoxDecoration(
                                  color: ColorConst.whiteColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 7.w,
                    ),
                    IconButton(
                      onPressed: () {
                        controller.updateShownBalance();
                      },
                      icon: Icon(
                        controller.showBalance
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color: ColorConst.whiteColor.withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.notify);
            },
            child: Container(
              height: 48.r,
              width: 48.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.whiteColor.withValues(alpha: 0.2),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(ImageConst.notifyIcon),
            ),
          ),
        ],
      ),
    );
  }
}
