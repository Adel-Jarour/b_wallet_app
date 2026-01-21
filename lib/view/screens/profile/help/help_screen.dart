import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/help_controller.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final HelpController controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.profileHelp,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: controller.helpItems[index].onTap,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 20.h,
                horizontal: 24.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: controller.helpItems[index].title,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  SvgPicture.asset(ImageConst.arrowNextIcon),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            color: ColorConst.grey4Color,
          );
        },
        itemCount: controller.helpItems.length,
      ),
    );
  }
}
