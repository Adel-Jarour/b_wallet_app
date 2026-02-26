import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/models/conversation_message_model.dart';
import 'package:b_wallet/models/message_model.dart';
import 'package:b_wallet/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ConversationType {
  normal,
  sendSuccess,
  requestSuccess,
}

class ConversationController extends GetxController {
  ConversationController({
    required this.type,
    required this.args,
  });

  final ConversationType type;
  final dynamic args;

  late final String userName;
  UserProfileModel? userProfile;

  bool get hasTransactionCard =>
      type == ConversationType.sendSuccess || type == ConversationType.requestSuccess;

  bool get isRequest => type == ConversationType.requestSuccess;

  late final String amount;
  late final String category;

  final List<ConversationMessage> messages = [];

  final TextEditingController inputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    if (type == ConversationType.normal) {
      _initFromMessageList(args);
    } else {
      _initFromTransaction(args);
    }
  }

  void _initFromMessageList(dynamic data) {
    if (data is MessageModel) {
      userName = data.name;
    } else if (data is Map && data['name'] is String) {
      userName = data['name'] as String;
    } else {
      userName = 'Unknown';
    }

    messages.addAll([
      ConversationMessage(
        text: 'Btw can how’re you doing bro?',
        isMe: false,
        time: '10:54 AM',
      ),
      ConversationMessage(
        text: 'Can you lend me \$1 again? haha',
        isMe: false,
        time: '10:55 AM',
      ),
      ConversationMessage(
        text: 'Sure! Anything for you',
        isMe: true,
        time: '10:55 AM',
      ),
      ConversationMessage(
        text: 'Thanks again bro 🙌',
        isMe: false,
        time: '10:56 AM',
      ),
    ]);
  }

  void _initFromTransaction(dynamic data) {
    if (data is Map<String, dynamic>) {
      userProfile = data['card'] as UserProfileModel?;
      userName = userProfile != null
          ? '${userProfile!.firstName} ${userProfile!.lastName}'
          : 'User';

      amount = data['number']?.toString() ?? '0';
      category = data['category']?.toString() ?? '';
    } else {
      userName = 'User';
      amount = '0';
      category = '';
    }

    messages.addAll([
      if (isRequest)
        ConversationMessage(
          text:
              'Hi $userName, can you send me \$$amount for the $category that you’ve bought yesterday?',
          isMe: false,
          time: '10:55 AM',
        )
      else
        ConversationMessage(
          text: 'Hi $userName, I’ve just sent you \$$amount for $category.',
          isMe: true,
          time: '10:55 AM',
        ),
      ConversationMessage(
        text: 'Okayy',
        isMe: !isRequest,
        time: '10:56 AM',
      ),
    ]);
  }

  void sendMessage() {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    messages.add(
      ConversationMessage(
        text: text,
        isMe: true,
        time: _currentTimeString,
      ),
    );
    inputController.clear();
    update();
  }

  String get _currentTimeString {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}

