import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/email_controller.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});

  final EmailController controller = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConst.primaryColor,
          leading: const CustomArrowBack(),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsetsDirectional.only(
            start: 24.w,
            end: 24.w,
            bottom: 50.h,
          ),
          foregroundDecoration: BoxDecoration(
            color: controller.isLoading
                ? ColorConst.blackColor.withValues(alpha: 0.3)
                : null,
          ),
          child: CustomButton(
            txt: Strings.buttonResetPassword,
            onTap: () {
              controller.submitEmail();
            },
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 24.w, end: 24.w, top: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80.r,
                      height: 80.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConst.lightBlue2Color,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(ImageConst.emailIcon),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomText(
                      txt: Strings.emailTitle,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    CustomText(
                      txt: Strings.emailMsg,
                      fontSize: 14.sp,
                      color: ColorConst.blackColor.withValues(alpha: 0.7),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFormField(
                      label: Strings.textFieldEmailAddress,
                      controller: controller.emailController,
                      errorTxt: controller.confirmError,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isLoading)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: ColorConst.blackColor.withValues(alpha: 0.3),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorConst.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
