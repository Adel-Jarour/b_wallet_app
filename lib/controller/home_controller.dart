import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/home_category_model.dart';
import 'package:b_wallet/models/home_header_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:b_wallet/view/cash_flow/cash_flow_screen.dart';
import 'package:b_wallet/view/home/home_screen.dart';
import 'package:b_wallet/view/message/message_screen.dart';
import 'package:b_wallet/view/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int bottomNavIndex = 0;

  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    update();
  }

  List<Widget> screens = [
    HomeScreen(),
    CashFlowScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  List<HomeHeaderModel> headerModels = [
    HomeHeaderModel(
      icon: ImageConst.topUpIcon,
      txt: Strings.homeTopUp,
      color: ColorConst.orangeColor,
      navigateTo: Routes.topUp,
    ),
    HomeHeaderModel(
      icon: ImageConst.sendIcon,
      txt: Strings.homeSend,
      color: ColorConst.purpleColor,
      navigateTo: Routes.send,
    ),
    HomeHeaderModel(
      icon: ImageConst.requestIcon,
      txt: Strings.homeRequest,
      color: ColorConst.softRedColor,
      navigateTo: Routes.request,
    ),
  ];
  List<HomeCategoryModel> categoriesModels = [
    HomeCategoryModel(
      icon: ImageConst.internetIcon,
      txt: Strings.homeInternet,
      navigateTo: '',
    ),
    HomeCategoryModel(
      icon: ImageConst.goldIcon,
      txt: Strings.homeGold,
      navigateTo: '',
    ),
    HomeCategoryModel(
      icon: ImageConst.electricityIcon,
      txt: Strings.homeElectricity,
      navigateTo: '',
    ),
    HomeCategoryModel(
      icon: ImageConst.othersIcon,
      txt: Strings.homeOthers,
      navigateTo: '',
    ),
  ];

  bool showBalance = false;

  void updateShownBalance() {
    showBalance = !showBalance;
    update();
  }
}
