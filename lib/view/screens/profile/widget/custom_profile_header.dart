import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208.h,
      child: Stack(
        children: [
          Container(
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
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              height: 92.h,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
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
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.profileSetting);
                },
                child: Row(
                  children: [
                    Hero(
                      tag: 'profileImage',
                      child: Container(
                        width: 60.r,
                        height: 60.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConst.grey4Color,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          ImageConst.profileIcon,
                          width: 27.w,
                          height: 27.h,
                          colorFilter: ColorFilter.mode(
                            ColorConst.grey2Color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          txt: 'Adel Jarour',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        CustomText(
                          txt: Strings.buttonEditProfile,
                          fontSize: 14.sp,
                          color: ColorConst.grey1Color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
