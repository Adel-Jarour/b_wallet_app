import 'package:b_wallet/const/list_const.dart';
import 'package:b_wallet/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final List<MessageModel> _messages = ListConst.messages;

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
