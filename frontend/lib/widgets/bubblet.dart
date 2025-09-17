import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';

class BotSpeechBubble extends StatelessWidget {
  const BotSpeechBubble({super.key, required this.context, required this.text});

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color backColor = Colors.grey.shade300;
    
    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
      backGroundColor: backColor,
      shadowColor: backColor,
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: MarkdownBody(
          data: text,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              color: Theme.of(context).textTheme.titleSmall!.color,
              fontSize: 16,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class UserSpeechBubble extends StatelessWidget {
  const UserSpeechBubble({
    super.key,
    required this.context,
    required this.text,
  });

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color backColor = Colors.indigo.shade400;
    Color shadowColor = Colors.grey.shade400;
    Color textColor = Colors.white;

    return ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 20),
      backGroundColor: backColor,
      shadowColor: shadowColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: MarkdownBody(
          data: text,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              color: textColor,
              fontSize: 16,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
