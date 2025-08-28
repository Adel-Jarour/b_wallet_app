import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/notify_controller.dart';
import 'package:b_wallet/models/notify_model.dart';
import 'package:b_wallet/view/home/notify/widget/custom_no_notification_received.dart';
import 'package:b_wallet/view/home/notify/widget/custom_notification.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotifyController controller = Get.put(NotifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          txt: Strings.notificationAppBarTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorConst.whiteColor,
        ),
        centerTitle: true,
      ),
      body: controller.noNotify
          ? const CustomNoNotificationReceived()
          : CustomNotification(),
    );
  }
}
