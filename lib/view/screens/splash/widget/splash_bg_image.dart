import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSplashBgImage extends StatelessWidget {
  CustomSplashBgImage({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: controller.showBottomSheet
          ? Alignment.center
          : Alignment.bottomCenter,
      child: Image.asset(ImageConst.waves),
    );
  }
}
