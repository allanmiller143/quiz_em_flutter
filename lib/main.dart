import 'package:flutter/material.dart';

import 'home_page.dart';
import 'quiz.dart';
import 'resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'Quiz': (context) => const Quiz(),
        Resultado.routeName:(context) => const Resultado(),
      

      },
    );
  }
}
