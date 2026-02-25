import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/models/user_profile_model.dart';
import 'package:b_wallet/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendController extends GetxController {
  var number = "0";
  bool correctSend = false;
  final TextEditingController searchController = TextEditingController();

  void addDigit(String digit) {
    if (number == "0" || suggestionSelected) {
      number = "";
    }
    number += digit;
    correctSend = true;
    suggestionSelected = false;
    update();
  }

  void removeDigit() {
    if (number == "0") return;
    number = number.substring(0, number.length - 1);
    if (number.isEmpty) {
      correctSend = false;
      number = "0";
    }
    update();
  }

  bool suggestionSelected = false;

  void selectFromSuggested(String num) {
    number = num;
    correctSend = true;
    suggestionSelected = true;
    update();
  }

  int? selectedUserIndex;

  void updateSelectedUser(int index) {
    selectedUserIndex = index;
    update();
  }

  List<UserProfileModel> searchedUsers = [];

  void onChange(String txt) {
    searchedUsers.clear();

    if (txt.trim().isEmpty) {
      update();
      return;
    }

    final query = txt.toLowerCase();

    searchedUsers = ListConst.users.where((user) {
      final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
      final phone = user.phoneNumber.toLowerCase();

      return fullName.contains(query) || phone.contains(query);
    }).toList();
    update();
  }

  bool get isSearching => searchController.text.trim().isNotEmpty;

  List<UserProfileModel> get filteredUsers =>
      isSearching ? searchedUsers : ListConst.users;

  bool get isEmptyState => isSearching && searchedUsers.isEmpty;

  RxString selectedCategory = ''.obs;

  bool get isRequestBottomSheetCorrect =>
      selectedCategory.value != '' && selectedUserIndex != null;

  void submitSend() {
    if (isRequestBottomSheetCorrect) {
      Get.toNamed(Routes.securityPin, arguments: {
        'app_bar_title': Strings.homeSend,
        'route_name': Routes.sendSuccess,
        'info': {
          'number': number,
          'card': ListConst.users[selectedUserIndex!],
          'category': selectedCategory.value,
        },
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
}
