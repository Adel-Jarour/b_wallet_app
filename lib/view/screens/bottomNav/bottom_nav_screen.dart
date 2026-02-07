import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/home_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final controller = Get.lazyPut(() => HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: controller.screens[controller.bottomNavIndex],
        floatingActionButton: SizedBox(
          width: 70.w,
          height: 70.h,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorConst.primaryColor,
            elevation: 8,
            shape: const CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageConst.payIcon),
                SizedBox(
                  height: 3.h,
                ),
                CustomText(
                  txt: Strings.bottomNavPay,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.whiteColor,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          color: ColorConst.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavItem(
                index: 0,
                ImageConst.homeIcon,
                Strings.bottomNavHome,
              ),
              _bottomNavItem(
                index: 1,
                ImageConst.cashFlowIcon,
                Strings.bottomNavCashFlow,
              ),
              SizedBox(width: 40.w),
              _bottomNavItem(
                index: 2,
                ImageConst.messageIcon,
                Strings.bottomNavMessage,
              ),
              _bottomNavItem(
                index: 3,
                ImageConst.profileIcon,
                Strings.bottomNavProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavItem(String icon, String label, {required int index}) {
    final HomeController controller = Get.find();
    return InkWell(
      onTap: () {
        controller.changeBottomNavIndex(index);
      },
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                controller.bottomNavIndex == index
                    ? ColorConst.orangeColor
                    : ColorConst.grey2Color,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomText(
              txt: label,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: controller.bottomNavIndex == index
                  ? ColorConst.blackColor
                  : ColorConst.grey2Color,
            ),
          ],
        ),
      ),
    );
  }
}
