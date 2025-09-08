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

class MainPage extends StatelessWidget {
  const MainPage({super.key}); 

  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
  );

  @override
  Widget build(BuildContext context) {
    final style = theme.textTheme.titleSmall!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: Center(
        child: Text(
          'Sua assistente virtual de\nComputação@UFCG',
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputField(),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        hintText: 'Digite sua dúvida aqui',
        suffixIcon: SendButton(
          onSend: () {
            print(_controller.text);
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
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
      color: Colors.indigo,
      onPressed: onSend,
    );
  }
}