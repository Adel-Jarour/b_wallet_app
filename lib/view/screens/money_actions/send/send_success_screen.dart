import 'package:b_wallet/controller/conversation_controller.dart';
import 'package:b_wallet/view/screens/message/conversation_screen.dart';
import 'package:flutter/material.dart';

class SendSuccessScreen extends StatelessWidget {
  const SendSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ConversationScreen(
      type: ConversationType.sendSuccess,
    );
  }
}
