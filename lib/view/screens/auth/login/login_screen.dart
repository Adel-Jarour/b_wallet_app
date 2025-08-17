import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/auth/login/widget/custom_login_form_field.dart';
import 'package:b_wallet/view/screens/auth/widget/custom_auth_question.dart';
import 'package:b_wallet/view/screens/auth/widget/custom_drag_handle.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 24.w,
          end: 24.w,
          top: 16.h,
          bottom: 30.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomDragHandle(),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                txt: Strings.loginSignIn,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),
            const CustomLoginFormField(),
            SizedBox(height: 20.h),
            CustomButton(
              txt: Strings.buttonSignIn,
              onTap: () {},
            ),
            SizedBox(height: 15.h),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.forgetPassMethod);
              },
              child: CustomText(
                txt: Strings.buttonForgetPass,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.orangeColor,
              ),
            ),
            SizedBox(height: 25.h),
            CustomAuthQuestion(
              question: Strings.loginHaveAccount,
              screen: Strings.buttonSignUp,
              onTap: () {
                controller.switchToSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
