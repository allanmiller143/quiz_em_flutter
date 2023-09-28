import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Quiz curso de Flutter & Dart")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FlutterLogo(size: 300),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10)),
                      child: const Text(
                        "Play",
                        style: TextStyle(fontSize: 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'Quiz');
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
