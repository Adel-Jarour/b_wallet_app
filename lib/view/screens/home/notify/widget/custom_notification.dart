import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/notify_controller.dart';
import 'package:b_wallet/models/notify_model.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomNotification extends StatelessWidget {
  CustomNotification({super.key});

  final NotifyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) {
          NotifyModel notify = controller.notificationList[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: _listViewItem(notify: notify),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: ColorConst.grey4Color,
          height: 32.h,
          thickness: 1,
        ),
        itemCount: controller.notificationList.length,
      ),
    );
  }

  Widget _listViewItem({required NotifyModel notify}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: notify.color,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(notify.icon),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: notify.title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomText(
                txt: notify.desc,
                fontSize: 13.sp,
                color: ColorConst.grey2Color,
                height: 1.3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
