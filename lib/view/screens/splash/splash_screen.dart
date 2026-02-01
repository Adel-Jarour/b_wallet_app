import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/view/screens/splash/widget/custom_auth_bottom_sheet.dart';
import 'package:b_wallet/view/screens/splash/widget/splash_bg_image.dart';
import 'package:b_wallet/view/screens/splash/widget/splash_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final AuthController controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: ColorConst.primaryColor,
          body: Stack(
            children: [
              CustomSplashHeader(),
              CustomSplashBgImage(),
              CustomAuthBottomSheet(),
            ],
          ),
        );
      },
    );
  }
}
