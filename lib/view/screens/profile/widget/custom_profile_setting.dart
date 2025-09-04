import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/profile_setting_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileSetting extends StatelessWidget {
  const CustomProfileSetting({
    super.key,
    required this.item,
    this.isLogOut = false,
  });

  final ProfileSettingModel item;
  final bool isLogOut;

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
        color: isLogOut ? ColorConst.redColor : null,
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
                SvgPicture.asset(
                  item.icon,
                  colorFilter: ColorFilter.mode(
                    isLogOut ? ColorConst.whiteColor : ColorConst.orangeColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                CustomText(
                  txt: item.title,
                  fontSize: 16.sp,
                  color:
                      isLogOut ? ColorConst.whiteColor : ColorConst.blackColor,
                ),
              ],
            ),
            SvgPicture.asset(
              ImageConst.arrowNextIcon,
              colorFilter: ColorFilter.mode(
                isLogOut ? ColorConst.whiteColor : ColorConst.orangeColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
