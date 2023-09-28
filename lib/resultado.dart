import 'package:flutter/material.dart';

class Argumentos {
  int acertos;
  Argumentos(this.acertos);
}

class Resultado extends StatelessWidget {
  static const routeName = 'resultado';
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Quiz curso de Flutter & Dart")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Resultado",
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  "Você acertou\n ${argumentos.acertos} de 10\nperguntas",
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                      child: const Text(
                        "Jogar novamente",
                        style: TextStyle(fontSize: 35),
                      ),
                      onPressed: () {
                        //Navigator.pop(context); se fizer assim ele volta para a tela mas nao reseta as informações 
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
