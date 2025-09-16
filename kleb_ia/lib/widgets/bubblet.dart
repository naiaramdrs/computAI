import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:kleb_ia/pages/chat_page.dart';
import 'package:flutter/material.dart';

class BotSpeechBubble extends StatelessWidget {
  const BotSpeechBubble({super.key, required this.context, required this.text});

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
      backGroundColor: Colors.white,
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class UserSpeechBubble extends StatelessWidget {
  const UserSpeechBubble({super.key, required this.widget});

  final ChatPage widget;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 20),
      backGroundColor: Colors.black,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          widget.submittedText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
