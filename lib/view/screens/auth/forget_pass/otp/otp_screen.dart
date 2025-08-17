import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(ImageConst.waves),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConst.whiteColor.withValues(alpha: 0.1),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(ImageConst.lockIcon),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomText(
                txt: Strings.otpTitle,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorConst.whiteColor,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomText(
                txt: Strings.otpDesc,
                fontSize: 14.sp,
                color: ColorConst.whiteColor.withValues(alpha: 0.7),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
