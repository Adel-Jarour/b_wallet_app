import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/send_controller.dart';
import 'package:b_wallet/models/user_profile_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSendToUser extends StatelessWidget {
  const CustomSendToUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendController>(builder: (controller) {
      if (controller.isEmptyState) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorConst.grey4Color,
              ),
            ),
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(ImageConst.warningIcon),
                SizedBox(height: 15.h),
                CustomText(
                  txt: Strings.requestContactNotFound,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                  height: 1.4,
                ),
              ],
            ),
          ),
        );
      }
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = controller.filteredUsers[index];
          return InkWell(
            onTap: () {
              controller.updateSelectedUser(user.id);
            },
            child: _SendToElement(
              user: user,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.h,
          );
        },
        itemCount: controller.filteredUsers.length,
      );
    });
  }
}

class _SendToElement extends StatelessWidget {
  final UserProfileModel user;

  const _SendToElement({required this.user});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SendController>();
    final isSelected = controller.selectedUserIndex == user.id;

    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? ColorConst.orangeColor : ColorConst.grey3Color,
        ),
        color: isSelected ? ColorConst.lightOrangeColor : Colors.transparent,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundImage: user.profileImageUrl != null
                ? AssetImage(user.profileImageUrl!)
                : null,
            child: user.profileImageUrl == null
                ? const Icon(Icons.supervisor_account_rounded)
                : null,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                txt: '${user.firstName} ${user.lastName}',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10.h),
              CustomText(
                txt: user.phoneNumber,
                fontSize: 13.sp,
                color:
                    isSelected ? ColorConst.orangeColor : ColorConst.grey1Color,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 18.r,
            height: 18.r,
            decoration: BoxDecoration(
              color:
                  isSelected ? ColorConst.lightOrangeColor : Colors.transparent,
              border: Border.all(
                color:
                    isSelected ? ColorConst.orangeColor : ColorConst.grey3Color,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.check,
              size: 15.r,
              color: isSelected ? ColorConst.orangeColor : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
