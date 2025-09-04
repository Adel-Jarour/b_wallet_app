import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.profileContact,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              txt: Strings.profileContact,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text.rich(
              TextSpan(
                text: Strings.contactDesc1,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Inter_18pt',
                  color: ColorConst.blackColor,
                ),
                children: [
                  TextSpan(
                    text: Strings.contactDesc2,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Inter_18pt',
                      fontWeight: FontWeight.w600,
                      color: ColorConst.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: Strings.contactDesc3,
                    style: TextStyle(
                      fontFamily: 'Inter_18pt',
                      fontSize: 14.sp,
                      color: ColorConst.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            _contactMethod(
              icon: ImageConst.atIcon,
              title: Strings.contactEmail,
              value: 'adel.jarour@gmail.com',
            ),
            SizedBox(
              height: 16.h,
            ),
            _contactMethod(
              icon: ImageConst.whatsAppIcon,
              title: Strings.contactWhatsapp,
              value: '+972567022104',
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactMethod(
      {required String icon, required String title, required String value}) {
    return Container(
      height: 88.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.grey3Color),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: ColorConst.orangeColor,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              colorFilter:
                  ColorFilter.mode(ColorConst.whiteColor, BlendMode.srcIn),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                txt: title,
                fontSize: 14.sp,
                color: ColorConst.grey1Color,
              ),
              CustomText(
                txt: value,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
