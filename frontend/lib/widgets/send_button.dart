import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback onSend;

  const SendButton({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey.shade400;
    
    return IconButton(
      icon: const Icon(Icons.arrow_circle_up),
      color: color,
      onPressed: onSend,
    );
  }
}