import 'package:kleb_ia/services/chat_service.dart';
import 'package:kleb_ia/widgets/input_field.dart';
import 'package:kleb_ia/widgets/top_bar.dart';
import 'package:kleb_ia/widgets/bubblet.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String submittedText;

  const ChatPage({super.key, required this.submittedText});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<ChatResponse> _answerFuture;
  final List<Message> _messages = [];
  String? _chatId;

  @override
  void initState() {
    super.initState();
    _addMessage(widget.submittedText, true);
    _answerFuture = createChat(widget.submittedText);
    _answerFuture.then((response) {
      _chatId = response.chatId;
      _addMessage(response.answer, false);
    });
  }

  void _handleSubmittedText(String text) {
    if (text.isNotEmpty) {
      _addMessage(text, true);
      _answerFuture = sendQuestionToChat(_chatId!, text);
      setState(() {});
      _answerFuture.then((response) {
        _addMessage(response.answer, false);
      });
    }
  }

  void _addMessage(String text, bool isUser) {
    setState(() {
      _messages.add(Message(text: text, isUser: isUser));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget builder(context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.grey,
              ),
            ),
          ),
        );
      } else if (snapshot.hasError || !snapshot.hasData) {
        return _buildAnswerBubble(
          'Não foi possível obter uma resposta. Tente novamente.',
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: TopBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ..._messages.map(
                    (msg) => Align(
                      alignment: msg.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: msg.isUser
                          ? UserSpeechBubble(context: context, text: msg.text)
                          : BotSpeechBubble(context: context, text: msg.text),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<ChatResponse>(
                    future: _answerFuture,
                    builder: builder,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InputField(
        onSend: (text) {
          _handleSubmittedText(text);
        },
      ),
    );
  }

  Widget _buildAnswerBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BotSpeechBubble(context: context, text: text),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
