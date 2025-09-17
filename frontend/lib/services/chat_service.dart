import 'package:klebia/configuration/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatResponse {
  final String message;
  final String answer;
  final String? chatId;

  ChatResponse({required this.message, required this.answer, this.chatId});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      message: json['message'] ?? '',
      answer: json['answer'] ?? '',
      chatId: json['chat_id'],
    );
  }
}

Future<ChatResponse> createChat(String question) async {
  try {
    final String hostPort = Config.apiBaseUrl;
    final url = Uri.parse('$hostPort/klebia/chat');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return ChatResponse.fromJson(data);
    }

    return ChatResponse(message: 'Ocorreu um erro! Tente Novamente', answer: '');
  } catch (e) {
    return ChatResponse(message: 'Ocorreu um erro: $e! Tente Novamente', answer: '');
  }
}

Future<ChatResponse> sendQuestionToChat(String chatId, String question) async {
  try {
    final String hostPort = Config.apiBaseUrl;
    final url = Uri.parse('$hostPort/klebia/chat/$chatId/question');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return ChatResponse.fromJson(data);
    }

    return ChatResponse(message: 'Ocorreu um erro! Tente Novamente', answer: '', chatId: chatId);
  } catch (e) {
    return ChatResponse(message: 'Ocorreu um erro: $e! Tente Novamente', answer: '', chatId: chatId);
  }
}
