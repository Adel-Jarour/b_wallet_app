import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/message_controller.dart';
import 'package:b_wallet/models/message_model.dart';
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
                    prefixIcon: SvgPicture.asset(ImageConst.searchIcon),
                    onChanged: controller.onSearchChanged,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: conversations.isEmpty
                      ? _EmptyMessageState(
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
                            return _MessageListItem(message: message);
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: ColorConst.grey4Color,
                            height: 24.h,
                            thickness: 1,
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

class _MessageListItem extends StatelessWidget {
  const _MessageListItem({
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.r,
          height: 48.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.grey4Color,
          ),
          alignment: Alignment.center,
          child: CustomText(
            txt: message.name.isNotEmpty ? message.name[0] : '',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: ColorConst.blackColor,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomText(
                            txt: message.name,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.blackColor,
                          ),
                        ),
                        if (message.isVerified) ...[
                          SizedBox(width: 4.w),
                          Container(
                            width: 12.r,
                            height: 12.r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    txt: message.time,
                    fontSize: 11.sp,
                    color: ColorConst.grey2Color,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      txt: message.lastMessage,
                      fontSize: 13.sp,
                      color: ColorConst.grey1Color,
                      maxLines: 1,
                    ),
                  ),
                  if (message.isUnread) ...[
                    SizedBox(width: 8.w),
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConst.orangeColor,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyMessageState extends StatelessWidget {
  const _EmptyMessageState({
    required this.onStartConversation,
  });

  final VoidCallback onStartConversation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72.r,
              height: 72.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.grey4Color,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.info_outline,
                size: 32.r,
                color: ColorConst.grey1Color,
              ),
            ),
            SizedBox(height: 24.h),
            CustomText(
              txt:
                  'No conversation at all, please start a conversation with your friends!',
              fontSize: 14.sp,
              color: ColorConst.grey1Color,
              textAlign: TextAlign.center,
              height: 1.4,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onStartConversation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConst.orangeColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: CustomText(
                  txt: 'Start Conversation',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.whiteColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

