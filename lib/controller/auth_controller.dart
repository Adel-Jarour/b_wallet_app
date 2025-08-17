import 'package:get/get.dart';

class AuthController extends GetxController {
  bool showBottomSheet = false;
  var currentSheet = AuthSheetType.login;

  void switchToSignUp() {
    currentSheet = AuthSheetType.signup;
    update();
  }

  void switchToLogin() {
    currentSheet = AuthSheetType.login;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      showBottomSheet = true;
      update();
    });
  }
}

enum AuthSheetType { login, signup }
