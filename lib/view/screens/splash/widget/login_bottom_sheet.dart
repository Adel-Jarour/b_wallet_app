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
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.55,
        minChildSize: 0.55,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: controller.currentSheet == AuthSheetType.login
                    ? LoginScreen(key: const ValueKey("login"))
                    : SignUpScreen(key: const ValueKey("signup")),
              ),
            ),
          );
        },
      ),
    );
  }
}
