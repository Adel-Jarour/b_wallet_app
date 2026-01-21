import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/email/email_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/forget_pass_method/forget_pass_method_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/otp/otp_screen.dart';
import 'package:b_wallet/view/screens/auth/forget_pass/reset_password/reset_pass_screen.dart';
import 'package:b_wallet/view/screens/auth/sign_up/pin/confirm_pin_screen.dart';
import 'package:b_wallet/view/screens/auth/sign_up/pin/pin_screen.dart';
import 'package:b_wallet/view/screens/bottomNav/bottom_nav_screen.dart';
import 'package:b_wallet/view/screens/cash_flow/transaction_history/transaction_history_screen.dart';
import 'package:b_wallet/view/screens/home/notify/notification_screen.dart';
import 'package:b_wallet/view/screens/profile/add_new_card/add_new_card_screen.dart';
import 'package:b_wallet/view/screens/profile/card/saved_card_screen.dart';
import 'package:b_wallet/view/screens/profile/contact/contact_screen.dart';
import 'package:b_wallet/view/screens/profile/help/help_screen.dart';
import 'package:b_wallet/view/screens/profile/privacy_policy/privacy_policy_screen.dart';
import 'package:b_wallet/view/screens/profile/profile_setting/profile_setting_screen.dart';
import 'package:b_wallet/view/screens/profile/terms_and_condition/terms_and_condition_screen.dart';
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
    GetPage(
      name: Routes.savedCard,
      page: () => SavedCardScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.addNewCard,
      page: () => AddNewCardScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.termsAndCondition,
      page: () => TermsAndConditionScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.contact,
      page: () => ContactScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.transactionHistory,
      page: () => TransactionHistoryScreen(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Routes.help,
      page: () => HelpScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
