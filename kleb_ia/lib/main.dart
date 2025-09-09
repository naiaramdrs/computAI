import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlebIA',
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
  
  static final ThemeData theme = ThemeData(
    primaryColor: Colors.blue.shade50,
  );

  String? _submittedText;

  @override
  Widget build(BuildContext context) {
    final style = theme.textTheme.titleSmall!.copyWith(
      color: Colors.grey.shade900,
    );

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: _submittedText == null
          ? Center(
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
            )
          : Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      _submittedText!,
                      style: style,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputField(
          onSend: (value) {
            setState(() {
              _submittedText = value.isEmpty ? null : value;
            });
          },
        ),
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
              if (text.isEmpty) {
                widget.onSend(''); 
              } else {
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
