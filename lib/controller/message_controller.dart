import 'package:b_wallet/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final List<MessageModel> _messages = [
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

  String _query = '';

  List<MessageModel> get messages {
    if (_query.isEmpty) {
      return List.unmodifiable(_messages);
    }
    final lower = _query.toLowerCase();
    return _messages
        .where(
          (m) =>
              m.name.toLowerCase().contains(lower) ||
              m.lastMessage.toLowerCase().contains(lower),
        )
        .toList(growable: false);
  }

  bool get hasMessages => _messages.isNotEmpty;

  void onSearchChanged(String value) {
    _query = value;
    update();
  }

  void clearSearch() {
    searchController.clear();
    _query = '';
    update();
  }

  void clearAllMessages() {
    _messages.clear();
    update();
  }

  void onTapNewConversation() {
    // TODO: integrate with real conversation creation / navigation.
    Get.snackbar(
      'Coming soon',
      'Starting a new conversation is not implemented yet.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

