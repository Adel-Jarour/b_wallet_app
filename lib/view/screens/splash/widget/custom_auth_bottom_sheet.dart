import 'package:b_wallet/controller/auth_controller.dart';
import 'package:b_wallet/view/screens/auth/login/login_screen.dart';
import 'package:b_wallet/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAuthBottomSheet extends StatelessWidget {
  CustomAuthBottomSheet({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final targetHeight = controller.currentSheet == AuthSheetType.login
        ? 0.55 * MediaQuery.sizeOf(context).height
        : 0.7 * MediaQuery.sizeOf(context).height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        height: controller.showBottomSheet ? targetHeight : 0,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: controller.currentSheet == AuthSheetType.login
                          ? const Offset(-1, 0)
                          : const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: controller.currentSheet == AuthSheetType.login
                    ? LoginScreen(key: const ValueKey('login'))
                    : SignUpScreen(key: const ValueKey('signup')),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
