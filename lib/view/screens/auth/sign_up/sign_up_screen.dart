import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/auth/sign_up/widget/custom_sign_up_form_field.dart';
import 'package:b_wallet/view/screens/auth/widget/custom_auth_question.dart';
import 'package:b_wallet/view/screens/auth/widget/custom_drag_handle.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();

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
                txt: Strings.signUp,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),
            const CustomSignUpFormField(),
            SizedBox(height: 20.h),
            CustomButton(
              txt: Strings.buttonSignUp,
              onTap: () {
                Get.toNamed(Routes.pin);
              },
            ),
            SizedBox(height: 25.h),
            CustomAuthQuestion(
              question: Strings.signUpHaveAccount,
              screen: Strings.buttonSignIn,
              onTap: () {
                controller.switchToLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
