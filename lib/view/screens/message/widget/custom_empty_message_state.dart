import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyMessageState extends StatelessWidget {
  const CustomEmptyMessageState({
    super.key,
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
