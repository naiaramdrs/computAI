import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback onSend;

  const SendButton({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_circle_up),
      color: Colors.grey.shade500,
      onPressed: onSend,
    );
  }
}