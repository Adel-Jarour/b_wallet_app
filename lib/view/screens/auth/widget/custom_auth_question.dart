import 'package:b_wallet/const/color_const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthQuestion extends StatelessWidget {
  const CustomAuthQuestion({
    super.key,
    required this.question,
    required this.screen,
    required this.onTap,
  });

  final String question;
  final String screen;
  final GestureCancelCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: question,
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorConst.grey2Color,
        ),
        children: [
          TextSpan(
            text: screen,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
