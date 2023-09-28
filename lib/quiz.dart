import 'package:app_quiz/resultado.dart';
import 'package:flutter/material.dart';
import 'perguntas_quiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int pergunta = 1;
  int acertos = 0;

  @override
  Widget build(BuildContext context) {
    if (pergunta == 1) {
      quiz.shuffle(); // embaralhar as perguntas
      quiz.forEach((elemento) {
        int alternativaCorreta = elemento['resposta'];
        String respostaCorreta = elemento['alternativas'][alternativaCorreta - 1];
        List alternativas = elemento['alternativas'];
        alternativas.shuffle();
        
        int i = 1;
        alternativas.forEach((element) {
          if (element == respostaCorreta) {
            elemento['resposta'] = i;
          }
          i++;
        });
      });
    }

    void respondeu(int numeroResposta) {
      setState(() {
        // verificar se acertou
        if (quiz[pergunta - 1]['resposta'] == numeroResposta) {
          acertos = acertos + 1;
        }

        if (pergunta == 10) {
          Navigator.pushNamed(context, 'resultado',
              arguments: Argumentos(acertos));
        } else {
          pergunta = pergunta + 1;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Quiz")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "pergunta $pergunta de 10",
                    style: const TextStyle(fontSize: 20),
                  )),
              Text(
                "Pergunta: ${quiz[pergunta - 1]['pergunta']}",
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    respondeu(1);
                  },
                  child: Text(
                    quiz[pergunta - 1]['alternativas'][0],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    respondeu(2);
                  },
                  child: Text(
                    quiz[pergunta - 1]['alternativas'][1],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    respondeu(3);
                  },
                  child: Text(
                    quiz[pergunta - 1]['alternativas'][2],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    respondeu(4);
                  },
                  child: Text(
                    quiz[pergunta - 1]['alternativas'][3],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
