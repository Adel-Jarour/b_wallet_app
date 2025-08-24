import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/forget_pass_controller.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/forget_pass_method/widget/custom_forget_pass_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomForgetPassMethodFormField extends StatelessWidget {
  const CustomForgetPassMethodFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassController>(
      id: 'method',
      builder: (controller) => Column(
        children: [
          CustomForgetPassMethod(
            onTap: () {
              controller.chooseForgetPassMethod(ForgetPassMethod.sms);
            },
            icon: ImageConst.smsIcon,
            title: Strings.forgetPassSms,
            desc: Strings.forgetPassSmsDisc,
            chooseMethod: controller.forgetPassMethod == ForgetPassMethod.sms,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomForgetPassMethod(
            onTap: () {
              controller.chooseForgetPassMethod(ForgetPassMethod.email);
            },
            icon: ImageConst.emailIcon,
            title: Strings.forgetPassEmail,
            desc: Strings.forgetPassEmailDesc,
            chooseMethod: controller.forgetPassMethod == ForgetPassMethod.email,
          ),
        ],
      ),
    );
  }
}
