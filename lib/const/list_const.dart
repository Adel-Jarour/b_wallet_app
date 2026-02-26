import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/models/message_model.dart';
import 'package:b_wallet/models/user_profile_model.dart';

class ListConst {
  static List<UserProfileModel> users = [
    UserProfileModel(
      id: 1,
      firstName: 'Adel',
      lastName: 'Jarour',
      phoneNumber: '0567022104',
    ),
    UserProfileModel(
      id: 2,
      firstName: 'Amjad',
      lastName: 'Kallob',
      phoneNumber: '0567777777',
    ),
    UserProfileModel(
      id: 3,
      firstName: 'Saleh',
      lastName: 'Hamda',
      phoneNumber: '0567555555',
    ),
    UserProfileModel(
      id: 4,
      firstName: 'Hamid',
      lastName: 'Khail',
      phoneNumber: '0567444444',
    ),
    UserProfileModel(
      id: 5,
      firstName: 'Mohammed',
      lastName: 'Jarour',
      phoneNumber: '0567333333',
    ),
    UserProfileModel(
      id: 6,
      firstName: 'Nader',
      lastName: 'Jarour',
      phoneNumber: '0567222222',
    ),
  ];

  static final List<String> categories = [
    Strings.requestFoodDrink,
    Strings.requestExpense,
    Strings.requestProperty,
    Strings.requestHobby,
    Strings.requestEntertainment,
  ];

  static List<String> suggestedNumbers = [
    "100",
    "500",
    "1000",
    "1500",
    "2500",
    "1350",
  ];

  static final List<MessageModel> messages = [
    MessageModel(
      name: 'Brittni Lando',
      lastMessage: 'Thanks buddy 👍',
      time: '10:56 AM',
      isVerified: true,
      isUnread: true,
    ),
    MessageModel(
      name: 'Darcel Ballentine',
      lastMessage: 'So true LOL',
      time: '10:54 AM',
      isUnread: true,
    ),
    MessageModel(
      name: 'Alfonzo Schuessler',
      lastMessage: 'Hahaha that’s very kind of you',
      time: '10:50 AM',
    ),
    MessageModel(
      name: 'Willard Purnell',
      lastMessage: 'Okay bro 👌',
      time: '10:46 AM',
    ),
    MessageModel(
      name: 'Maryland Winkles',
      lastMessage: 'What’s up buddy? haha',
      time: '10:40 AM',
    ),
    MessageModel(
      name: 'Geoffrey Mott',
      lastMessage: 'I don’t know bro, perhaps John...',
      time: '10:35 AM',
    ),
  ];
}
