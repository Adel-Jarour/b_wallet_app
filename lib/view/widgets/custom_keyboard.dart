import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    required this.add,
    required this.remove,
    this.isKeyWhite = true,
  });

  final VoidCallback remove;
  final Function(String number) add;
  final bool isKeyWhite;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 32.w,
          mainAxisSpacing: 32.h,
        ),
        itemBuilder: (context, index) {
          if (index == 9) return const SizedBox();
          if (index == 11) {
            return _buildKey(
              icon: Icons.backspace,
              onTap: remove,
            );
          }
          String number = index == 10 ? "0" : (index + 1).toString();
          return _buildKey(
            text: number,
            onTap: () => add(number),
          );
        },
      ),
    );
  }

  Widget _buildKey({String? text, IconData? icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isKeyWhite
                ? ColorConst.whiteColor.withValues(alpha: 0.5)
                : ColorConst.grey3Color,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: text != null
              ? CustomText(
                  txt: text,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: isKeyWhite
                      ? ColorConst.whiteColor
                      : ColorConst.blackColor,
                )
              : Icon(
                  icon,
                  color: isKeyWhite
                      ? ColorConst.whiteColor
                      : ColorConst.blackColor,
                  size: 26,
                ),
        ),
      ),
    );
  }
}
