import 'package:kleb_ia/widgets/input_field.dart';
import 'package:kleb_ia/pages/chat_page.dart';
import 'package:flutter/material.dart';

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
                builder: (context) => ChatPage(submittedText: value),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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