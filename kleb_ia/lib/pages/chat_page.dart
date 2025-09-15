import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:kleb_ia/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';

class ChatPage extends StatefulWidget {
  final String submittedText;

  const ChatPage({super.key, required this.submittedText});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<String?> _answerFuture;

  @override
  void initState() {
    super.initState();
    _answerFuture = sendQuestion(widget.submittedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 160, 238),
        leading: Image.asset('images/logo_sem_fundo.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mensagem enviada pelo usuário
            Align(
              alignment: Alignment.centerRight,
              child: ChatBubble(
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
              ),
            ),

            // Resposta da API
            const SizedBox(height: 20),
            FutureBuilder<String?>(
              future: _answerFuture,
              builder: (context, snapshot) {
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
                } else if (snapshot.hasError) {
                  return _buildAnswerBubble('Erro: ${snapshot.error}');
                } else {
                  final answer = snapshot.data ?? 'Sem resposta disponível';
                  return _buildAnswerBubble(answer);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ChatBubble(
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
      ),
    );
  }
}
