import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/forget_pass_controller.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/forget_pass_method/widget/custom_forget_pass_method_form_field.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPassMethodScreen extends StatelessWidget {
  ForgetPassMethodScreen({super.key});

  final ForgetPassController controller = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 40.h,
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              txt: Strings.forgetPassTitle,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              txt: Strings.forgetPassMethodDesc,
              fontSize: 14.sp,
              height: 1.3,
            ),
            SizedBox(
              height: 25.h,
            ),
            const CustomForgetPassMethodFormField(),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              txt: Strings.buttonConfirm,
              onTap: () {
                controller.methodChosen();
              },
            ),
          ],
        ),
      ),
    );
  }
}
