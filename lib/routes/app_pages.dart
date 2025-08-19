import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/email/email_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/forget_pass_method/forget_pass_method_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/reset_password/reset_pass_screen.dart';
import 'package:b_wallet/view/screens/home/home_screen.dart';
import 'package:b_wallet/view/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.forgetPassMethod,
      page: () => ForgetPassMethodScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.otp,
      page: () => OtpScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.email,
      page: () => EmailScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.resetPass,
      page: () => ResetPassScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
