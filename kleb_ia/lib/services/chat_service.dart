import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> sendQuestion(String question) async {
  try {
    final url = Uri.parse('http://10.0.2.2:5000/chat');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['answer'];
    }

    return 'Erro: ${response.statusCode}';
  } catch (e) {
    return 'Erro de conexão: $e';
  }
}

Future<String?> sendQuestionToChat(String chatId, String question) async {
  try {
    final url = Uri.parse('http://10.0.2.2:5000/chat/$chatId/question');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['answer'];
    }

    return 'Erro: ${response.statusCode}';
  } catch (e) {
    return 'Erro de conexão: $e';
  }
}