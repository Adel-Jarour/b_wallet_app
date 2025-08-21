import 'package:b_wallet/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool showBottomSheet = false;
  var currentSheet = AuthSheetType.login;

  bool showPass = true;

  void updateShowPass() {
    showPass = !showPass;
    update();
  }

  void switchToSignUp() {
    currentSheet = AuthSheetType.signup;
    update();
  }

  void switchToLogin() {
    currentSheet = AuthSheetType.login;
    update();
  }

  bool loginSubmittedAnimation = false;

  void loginSubmit() async {
    loginSubmittedAnimation = true;
    update(['login_submit']);
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        loginSubmittedAnimation = false;
        update(['login_submit']);
        Get.toNamed(Routes.home);
      },
    );
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
