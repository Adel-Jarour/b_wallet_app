import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/conversation_controller.dart';
import 'package:b_wallet/models/conversation_message_model.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({
    super.key,
    required this.type,
  });

  final ConversationType type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
      init: ConversationController(
        type: type,
        args: Get.arguments,
      ),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.whiteColor,
          appBar: AppBar(
            backgroundColor: ColorConst.primaryColor,
            elevation: 0,
            leading: const CustomArrowBack(),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  txt: controller.userName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.whiteColor,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  txt: 'Today',
                  fontSize: 12.sp,
                  color: ColorConst.whiteColor.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: ColorConst.whiteColor,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    children: [
                      if (controller.hasTransactionCard)
                        _TransactionCard(
                          isRequest: controller.isRequest,
                          amount: controller.amount,
                          category: controller.category,
                        ),
                      if (controller.hasTransactionCard) SizedBox(height: 16.h),
                      _TodayLabel(),
                      SizedBox(height: 16.h),
                      if (controller.messages.isEmpty)
                        _EmptyEncryptionMessage()
                      else
                        ...controller.messages
                            .map((m) => _ChatBubble(message: m))
                            .expand(
                              (widget) => [
                                widget,
                                SizedBox(height: 12.h),
                              ],
                            )
                            .toList(),
                    ],
                  ),
                ),
              ),
              _MessageComposer(
                controller: controller,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TodayLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: ColorConst.grey4Color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: CustomText(
            txt: 'Today',
            fontSize: 11.sp,
            color: ColorConst.grey1Color,
          ),
        ),
      ],
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message});

  final ConversationMessage message;

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final alignment =
        isMe ? Alignment.centerRight : Alignment.centerLeft;
    final bgColor = isMe ? ColorConst.primaryColor : ColorConst.grey4Color;
    final textColor = isMe ? ColorConst.whiteColor : ColorConst.blackColor;

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            constraints: BoxConstraints(
              maxWidth: 260.w,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomLeft:
                    Radius.circular(isMe ? 16.r : 4.r),
                bottomRight:
                    Radius.circular(isMe ? 4.r : 16.r),
              ),
            ),
            child: CustomText(
              txt: message.text,
              fontSize: 13.sp,
              color: textColor,
              height: 1.3,
            ),
          ),
          SizedBox(height: 4.h),
          CustomText(
            txt: message.time,
            fontSize: 10.sp,
            color: ColorConst.grey2Color,
          ),
        ],
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    required this.isRequest,
    required this.amount,
    required this.category,
  });

  final bool isRequest;
  final String amount;
  final String category;

  @override
  Widget build(BuildContext context) {
    final title = isRequest ? 'Friend requested' : 'You\'ve sent';
    final badgeText = isRequest ? 'Requested' : 'Sent';
    final badgeColor = isRequest ? ColorConst.orangeColor : ColorConst.greenColor;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                txt: title,
                fontSize: 13.sp,
                color: ColorConst.grey1Color,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: CustomText(
                  txt: badgeText,
                  fontSize: 11.sp,
                  color: badgeColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomText(
            txt: '\$$amount.00',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: ColorConst.blackColor,
          ),
          SizedBox(height: 8.h),
          CustomText(
            txt: category,
            fontSize: 13.sp,
            color: ColorConst.grey1Color,
          ),
        ],
      ),
    );
  }
}

class _EmptyEncryptionMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorConst.grey4Color),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              size: 32.r,
              color: ColorConst.grey1Color,
            ),
            SizedBox(height: 16.h),
            CustomText(
              txt:
                  'This message is using end-to-end encryption.\nNo one outside this chat can read your message.\nType your first message.',
              fontSize: 13.sp,
              color: ColorConst.grey1Color,
              textAlign: TextAlign.center,
              height: 1.4,
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer({
    required this.controller,
  });

  final ConversationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 8.h,
        bottom: 8.h + MediaQuery.of(context).padding.bottom,
      ),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: ColorConst.grey5Color,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: TextField(
                controller: controller.inputController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your message',
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                minLines: 1,
                maxLines: 3,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: ColorConst.orangeColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send_rounded,
                size: 22.r,
                color: ColorConst.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

