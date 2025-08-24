import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/pin_controller.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({super.key});

  final PinController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 35.w),
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
              onTap: controller.removeDigit,
            );
          }
          String number = index == 10 ? "0" : (index + 1).toString();
          return _buildKey(
            text: number,
            onTap: () => controller.addDigit(number),
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
            color: ColorConst.whiteColor.withValues(alpha: 0.5),
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
                  color: ColorConst.whiteColor,
                )
              : Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
