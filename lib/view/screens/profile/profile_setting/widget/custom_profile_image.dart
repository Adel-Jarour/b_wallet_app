import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'profileImage',
          child: Container(
            width: 105.w,
            height: 97.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConst.grey4Color,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              ImageConst.profileIcon,
              width: 44.w,
              height: 44.h,
              colorFilter: ColorFilter.mode(
                ColorConst.grey2Color,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        PositionedDirectional(
          end: 0,
          bottom: 4.h,
          child: Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: ColorConst.orangeColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(ImageConst.cameraIcon),
          ),
        ),
      ],
    );
  }
}
