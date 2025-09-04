import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/profile_setting_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileSettingModel> accountItems = [
    ProfileSettingModel(
      icon: ImageConst.balanceIcon,
      title: Strings.profileBalance,
      value: "\$56,000.00",
      onTap: () {},
    ),
    ProfileSettingModel(
      icon: ImageConst.cardIcon,
      title: Strings.profileSavedCard,
      value: "2 cards",
      onTap: () {
        Get.toNamed(Routes.savedCard);
      },
    ),
    ProfileSettingModel(
      icon: ImageConst.referralIcon,
      title: Strings.profileReferralCode,
      value: "3 Invitation",
      onTap: () {},
    ),
  ];

  final List<ProfileSettingModel> appSettingItems = [
    ProfileSettingModel(
      icon: ImageConst.securityIcon,
      title: Strings.profileSecurityPin,
      onTap: () {},
    ),
    ProfileSettingModel(
      icon: ImageConst.helpIcon,
      title: Strings.profileHelp,
      onTap: () {},
    ),
    ProfileSettingModel(
      icon: ImageConst.termsIcon,
      title: Strings.profileTermCondition,
      onTap: () {
        Get.toNamed(Routes.termsAndCondition);
      },
    ),
    ProfileSettingModel(
      icon: ImageConst.privacyIcon,
      title: Strings.profilePrivacyPolicy,
      onTap: () {
        Get.toNamed(Routes.privacyPolicy);
      },
    ),
    ProfileSettingModel(
      icon: ImageConst.contactIcon,
      title: Strings.profileContact,
      onTap: () {
        Get.toNamed(Routes.contact);
      },
    ),
  ];

  ProfileSettingModel logOutItem = ProfileSettingModel(
    icon: ImageConst.logOutIcon,
    title: Strings.profileLogOut,
    onTap: () {},
  );
}
