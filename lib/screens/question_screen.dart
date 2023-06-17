import 'package:flutter/material.dart';
import 'package:quiz/design.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/quest_widget.dart';
import '../models/button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onAnswer;
  final TextEditingController textFieldController;
  final bool errorMessageVisible;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.onAnswer,
    required this.textFieldController,
    required this.errorMessageVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Question',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            QuestionWidget(
              question: question.title,
              onAnswer: onAnswer,
              correctAnswer: question.correctAnswer,
              reponses: question.reponses,
              textFieldController: textFieldController,
              errorMessageVisible: errorMessageVisible,
              indexAction: 0,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Button(nextQuestion: () {
          Navigator.pop(context);
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
