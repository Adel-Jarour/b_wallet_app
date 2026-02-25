import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/send_controller.dart';
import 'package:b_wallet/view/screens/money_actions/request/widget/custom_number_of_request_bottom_sheet.dart';
import 'package:b_wallet/view/screens/money_actions/send/widget/custom_send_select_category_bottom_sheet.dart';
import 'package:b_wallet/view/screens/money_actions/send/widget/custom_send_to_user.dart';
import 'package:b_wallet/view/widgets/custom_button.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSendBottomSheet extends StatelessWidget {
  CustomSendBottomSheet({super.key});

  final SendController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 0.h,
        start: 24.w,
        end: 24.w,
        bottom: 30.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4.h,
              width: 24.w,
              margin: EdgeInsetsDirectional.only(top: 16.h, bottom: 23.h),
              decoration: BoxDecoration(
                color: ColorConst.grey4Color,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
            ),
          ),
          CustomNumberOfRequestBottomSheet(
            number: controller.number,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomSendSelectCategoryBottomSheet(),
          SizedBox(
            height: 32.h,
          ),
          CustomText(
            txt: Strings.requestRequestTo,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFormField(
            controller: controller.searchController,
            onChanged: (String txt) {
              controller.onChange(txt);
            },
            fillColor: ColorConst.grey5Color,
            hintTxt: Strings.textFieldTypeSearchContact,
            hintFontSize: 16.sp,
            suffixIcon: SvgPicture.asset(
              ImageConst.searchIcon,
            ),
            suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
          ),
          SizedBox(
            height: 24.h,
          ),
          const Expanded(child: CustomSendToUser()),
          SizedBox(
            height: 36.h,
          ),
          CustomButton(
            txt: Strings.buttonRequest,
            onTap: controller.submitSend,
          ),
        ],
      ),
    );
  }
}
