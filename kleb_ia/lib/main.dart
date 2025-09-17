import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlebIA',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleSmall: TextStyle(color: Color(0xFF212121), fontSize: 16),
        ),
        scaffoldBackgroundColor: Colors.indigo.shade400,
      ),
      home: const MainPage(),
    );
  }
}