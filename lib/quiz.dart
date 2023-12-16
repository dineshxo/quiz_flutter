import 'package:quiz/questions.dart';

class Quiz {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }
}
