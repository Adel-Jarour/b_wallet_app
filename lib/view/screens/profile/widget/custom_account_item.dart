import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/profile_setting_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileAccountItem extends StatelessWidget {
  const CustomProfileAccountItem({super.key, required this.item});

  final ProfileSettingModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        end: 20.w,
      ),
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorConst.grey4Color),
      ),
      child: InkWell(
        onTap: item.onTap,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(item.icon),
                SizedBox(
                  width: 12.w,
                ),
                CustomText(
                  txt: item.title,
                  fontSize: 16.sp,
                ),
              ],
            ),
            Row(
              children: [
                CustomText(
                  txt: item.value,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.orangeColor,
                ),
                SizedBox(
                  width: 13.w,
                ),
                SvgPicture.asset(
                  ImageConst.arrowNextIcon,
                  colorFilter: ColorFilter.mode(
                    ColorConst.orangeColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
