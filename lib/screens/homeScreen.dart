import 'package:flutter/material.dart';
import 'package:quiz/design.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/widgets/quest_widget.dart';
import '../main.dart';
import '../models/button.dart';

class HomeScreen extends StatefulWidget {
  final List<Question> questions;

  const HomeScreen({Key? key, required this.questions}) : super(key: key);
  static const routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  int _currentQuestionIndex = 1;

  TextEditingController _textFieldController = TextEditingController();
  bool _showErrorMessage = false;
  int _correctAnswers = 0;
  Map<int, String?> _userAnswers = {};

  void _onAnswerSelected(String answer) {
    final question = widget.questions[_index];
    final userAnswer = answer.trim().toLowerCase();

    if (userAnswer.isEmpty) {
      setState(() {
        _showErrorMessage = true;
      });
    } else if (userAnswer == question.correctAnswer.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Bonne réponse !'),
          backgroundColor: correct,
        ),
      );
      setState(() {
        _correctAnswers++;
        _showErrorMessage = false;
        _textFieldController.clear();
        _nextQuestion();
        _userAnswers[_index] = userAnswer;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Mauvaise réponse !'),
          backgroundColor: incorrect,
        ),
      );
      _userAnswers[_index] = userAnswer;
    }
  }

  void _nextQuestion() {
    if (_index == widget.questions.length - 1) {
      _showQuizSummary(context);
    } else {
      _showErrorMessage = false;
      setState(() {
        _index++;
        _currentQuestionIndex++;
      });
    }
  }

  void _showQuizSummary(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Summary'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Score: $_correctAnswers/${widget.questions.length}'),
              const SizedBox(height: 10),
              Text('Réponses sélectionnées:'),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.questions.length, (index) {
                  final question = widget.questions[index];
                  final userAnswer = _userAnswers[index]?.trim();
                  final answerText = userAnswer != null && userAnswer.isNotEmpty
                      ? userAnswer
                      : 'Aucune réponse';
                  return Text('Question ${index + 1}: $answerText');
                }),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, PageName.homePage);
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_index];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Projet final du cours de Flutter'),
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Question ${_index + 1}/${widget.questions.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            QuestionWidget(
              question: question.title,
              onAnswer: _onAnswerSelected,
              correctAnswer: question.correctAnswer,
              reponses: question.reponses,
              textFieldController: _textFieldController,
              errorMessageVisible: _showErrorMessage,
              indexAction: _index,
            ),
            const Divider(color: neutral),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Button(nextQuestion: _nextQuestion),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
