import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/models/help_model.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  List<HelpModel> helpItems = [
    HelpModel(
      id: 0,
      title: Strings.helpItemWhatBWalletApp,
      onTap: () {},
    ),
    HelpModel(
      id: 1,
      title: Strings.helpItemGeneralInformation,
      onTap: () {},
    ),
    HelpModel(
      id: 2,
      title: Strings.homeTopUp,
      onTap: () {},
    ),
    HelpModel(
      id: 3,
      title: Strings.homeRequest,
      onTap: () {},
    ),
    HelpModel(
      id: 4,
      title: Strings.homeSend,
      onTap: () {},
    ),
    HelpModel(
      id: 5,
      title: Strings.helpItemClaimPromo,
      onTap: () {},
    ),
    HelpModel(
      id: 6,
      title: Strings.profileSecurityPin,
      onTap: () {},
    ),
    HelpModel(
      id: 7,
      title: Strings.helpItemPayment,
      onTap: () {},
    ),
  ];
}
