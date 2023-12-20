import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Question {
  final String questionText;
  final List<Map<String, Object>> answers;

  Question(this.questionText, this.answers);
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      'What is the capital of France?',
      [
        {'text': 'Berlin', 'score': 0},
        {'text': 'Paris', 'score': 1},
        {'text': 'Madrid', 'score': 0},
        {'text': 'Rome', 'score': 0},
      ],
    ),
    Question(
      'Which is the largest mammal?',
      [
        {'text': 'Elephant', 'score': 0},
        {'text': 'Blue Whale', 'score': 1},
        {'text': 'Giraffe', 'score': 0},
        {'text': 'Hippopotamus', 'score': 0},
      ],
    ),
    Question(
      'Which is the largest mammal?',
      [
        {'text': 'Elephant', 'score': 0},
        {'text': 'Blue Whale', 'score': 1},
        {'text': 'Giraffe', 'score': 0},
        {'text': 'Hippopotamus', 'score': 0},
      ],
    ),
    Question(
      'Which is oue falg color ?',
      [
        {'text': 'yellow', 'score': 0},
        {'text': 'Blue ', 'score': 0},
        {'text': 'Green', 'score': 1},
        {'text': 'Purple', 'score': 0},
      ],
    ),
    Question(
      'What is your name ?',
      [
        {'text': 'Aamna', 'score': 1},
        {'text': 'Saba', 'score': 0},
        {'text': 'Hira', 'score': 0},
        {'text': 'Fatima', 'score': 0},
      ],
    ),

    // Add more questions as needed
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Result(_score, _resetQuiz, _questions.length),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Question> questions;
  final Function(int) answerQuestion;

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionWidget(questions[questionIndex].questionText),
        ...(questions[questionIndex].answers as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'] as String);
        }).toList(),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String questionText;

  QuestionWidget(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;
  final int totalQuestions;

  Result(this.score, this.resetHandler, this.totalQuestions);

  String get resultPhrase {
    if (score == 0) {
      return 'No correct answers!';
    } else if (score == totalQuestions) {
      return 'Perfect Score!';
    } else if (score >= totalQuestions / 2) {
      return 'Good Job!';
    } else {
      return 'Try Again!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Score: $score/$totalQuestions',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: resetHandler,
          child: Text('Restart Quiz'),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}
