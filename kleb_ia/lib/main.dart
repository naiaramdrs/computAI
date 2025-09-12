import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlebIA',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            color: Color(0xFF212121),
            fontSize: 16,
          )
        ),
        scaffoldBackgroundColor: Colors.blue.shade50,
      ),
      home: const MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WelcomePage(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputField(
          onSend: (value) {
            setState(() {
              value;
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  submittedText: value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required String? submittedText,
  }) : _submittedText = submittedText;

  final String? _submittedText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
            AppBar(
            backgroundColor: const Color.fromARGB(255, 109, 160, 238),
            leading: Image.asset('images/logo_sem_fundo.png'),
            actions: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                );
                },
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 24.0),
              child: 
                ChatBubble(
                  clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 20),
                  backGroundColor: Colors.black,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Text(
                      _submittedText!,
                      style: TextStyle(color: Colors.white, fontSize: 16, decoration: TextDecoration.none, fontWeight: FontWeight.normal ),
                    ),
                  ),
                ),
            ),
          ),
            if (_submittedText.isNotEmpty) ...[
            FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2)),
              builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Padding(
                padding: EdgeInsets.only(left: 24.0, top: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 2, )),
                ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                child: ChatBubble(
                  clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
                  backGroundColor: Colors.white,
                  margin: const EdgeInsets.only(top: 20),
                  child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: const Text(
                    'Resposta da KlebIA',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    ),
                  ),
                  ),
                ),
                ),
              );
              },
            ),
          ]
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall!;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo_sem_fundo.png', width: 200, height: 200),
            Text(
              'Sua assistente virtual de\nComputação@UFCG',
              style: style,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
      
  }
}

class InputField extends StatefulWidget {
  final ValueChanged<String> onSend;

  const InputField({
    super.key,
    required this.onSend,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 14.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
          hintText: 'Digite sua dúvida aqui',
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          suffixIcon: SendButton(
            onSend: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty) {
                widget.onSend(text);
                _controller.clear();
              }
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final VoidCallback onSend;

  const SendButton({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_circle_up),
      color:Colors.grey.shade500,
      onPressed: onSend,
    );
  }
}
