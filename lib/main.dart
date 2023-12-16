import 'package:flutter/material.dart';

import 'package:quiz/quiz.dart';

void main() {
  runApp(const MyApp());
}

Quiz quiz = Quiz();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  static List<Icon> scoreKeeper = [];

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quiz.getCorrectAnswer();

    if (correctAnswer == userPickedAnswer) {
      HomePage.scoreKeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      HomePage.scoreKeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    setState(() {
      quiz.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quiz.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 245, 245, 245),
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: const Text('True'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 245, 245, 245),
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: const Text('False'),
                  ),
                ),
              ),
              Row(
                children: HomePage.scoreKeeper,
              )
            ],
          ),
        )));
  }
}

//You can lead a cow down stairs but not up stairs.- False
//Approximately one quarter of human bones are the feet. - True
//A slug\'s blood is green. -  True
