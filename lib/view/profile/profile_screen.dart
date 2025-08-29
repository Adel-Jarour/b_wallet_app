import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/profile_controller.dart';
import 'package:b_wallet/view/profile/widget/custom_account_item.dart';
import 'package:b_wallet/view/profile/widget/custom_profile_header.dart';
import 'package:b_wallet/view/profile/widget/custom_profile_setting.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomProfileHeader(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 24.w,
              vertical: 32.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...controller.accountItems.map(
                  (e) => CustomProfileAccountItem(item: e),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  txt: Strings.profileAppSetting,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ...controller.appSettingItems.map(
                  (e) => CustomProfileSetting(item: e),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomProfileSetting(
                  item: controller.logOutItem,
                  isLogOut: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
