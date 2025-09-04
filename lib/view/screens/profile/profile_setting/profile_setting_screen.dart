import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/view/screens/profile/profile_setting/widget/custom_profile_image.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_input_field.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.profileSettingAppBarTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 30.h),
        child: CustomButton(
          txt: Strings.buttonSaveChange,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 32.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomProfileImage(),
              SizedBox(
                height: 32.h,
              ),
              CustomInputField(
                title: Strings.textFieldName,
                controller: TextEditingController(text: 'Adel Jarour'),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInputField(
                title: Strings.textFieldEmailAddress,
                controller:
                    TextEditingController(text: 'adel.jarour@gmail.com'),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInputField(
                title: Strings.textFieldPhoneNum,
                controller: TextEditingController(text: '0567022104'),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInputField(
                title: Strings.textFieldBirthday,
                controller: TextEditingController(text: '24 April 2001'),
                icon: ImageConst.birthdayIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
