import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'KlebIA',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 2, 1, 83)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// Notifica quando uma mudança é realizada
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('Uma assistente virtual de computação@UFCG'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('->'),
          ),
        ],
      ),
    );
  }
}