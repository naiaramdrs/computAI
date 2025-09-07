import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KlebIA',
      home: const SimplePage(),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key}); 

  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.indigo,
  );

  @override
  Widget build(BuildContext context) {
    final style = theme.textTheme.titleSmall!.copyWith(
      color: theme.colorScheme.onSecondary,
    );

    return Scaffold(
      body: Center(
        child: Text(
            'Sua assistente virtual de\nComputação@UFCG',
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: theme.colorScheme.secondary,
    );
  }
}