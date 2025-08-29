import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/home/notify/notification_screen.dart';
import 'package:b_wallet/view/profile/profile_setting/profile_setting_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/email/email_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/forget_pass_method/forget_pass_method_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/reset_password/reset_pass_screen.dart';
import 'package:b_wallet/view/screens/auth/sign_up/pin/confirm_pin_screen.dart';
import 'package:b_wallet/view/screens/auth/sign_up/pin/pin_screen.dart';
import 'package:b_wallet/view/screens/bottomNav/bottom_nav_screen.dart';
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
      page: () => BottomNavScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.resetPass,
      page: () => ResetPassScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.pin,
      page: () => PinScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.confirmPin,
      page: () => ConfirmPinScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.notify,
      page: () => NotificationScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.profileSetting,
      page: () => ProfileSettingScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
