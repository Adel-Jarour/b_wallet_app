import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/models/message_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageListItem extends StatelessWidget {
  const CustomMessageListItem({
    super.key,
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
          child: Icon(
            Icons.person,
            color: ColorConst.grey2Color,
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConst.primaryColor,
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
