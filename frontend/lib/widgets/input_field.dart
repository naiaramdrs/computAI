import 'package:klebia/widgets/send_button.dart';
import 'package:flutter/material.dart';

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 14.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(color: Colors.grey[400]),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black87,
          border: const OutlineInputBorder(),
            hintText: 'Digite sua dúvida aqui',
            hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 16.0,
          ),
          suffixIcon: SendButton(
            onSend: () {
              widget.onSend(_controller.text.trim());
              _controller.clear();
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black87),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final ValueChanged<String> onSend;

  const InputField({super.key, required this.onSend});

  @override
  State<InputField> createState() => _InputFieldState();
}
