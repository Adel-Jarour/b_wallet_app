import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/message_controller.dart';
import 'package:b_wallet/models/message_model.dart';
import 'package:b_wallet/view/screens/message/widget/custom_empty_message_state.dart';
import 'package:b_wallet/view/screens/message/widget/custom_message_list_item.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:b_wallet/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        final List<MessageModel> conversations = controller.messages;

        return Scaffold(
          backgroundColor: ColorConst.whiteColor,
          appBar: AppBar(
            backgroundColor: ColorConst.whiteColor,
            elevation: 0,
            centerTitle: false,
            titleSpacing: 24.w,
            title: CustomText(
              txt: Strings.bottomNavMessage,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorConst.blackColor,
            ),
            actions: [
              IconButton(
                onPressed: controller.onTapNewConversation,
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomTextFormField(
                    controller: controller.searchController,
                    hintTxt: Strings.textFieldTypeSearchContact,
                    fillColor: ColorConst.grey5Color,
                    suffixIcon: SvgPicture.asset(ImageConst.searchIcon),
                    onChanged: controller.onSearchChanged,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: conversations.isEmpty
                      ? CustomEmptyMessageState(
                          onStartConversation: controller.onTapNewConversation,
                        )
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 8.h,
                          ),
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemBuilder: (context, index) {
                            final message = conversations[index];
                            return CustomMessageListItem(message: message);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 24.h,
                          ),
                          itemCount: conversations.length,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
