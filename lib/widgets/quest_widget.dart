import 'package:flutter/widgets.dart';
import 'package:quiz/design.dart';

import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.onAnswer,
    required this.correctAnswer,
    required this.reponses,
    required this.textFieldController,
    required this.errorMessageVisible,
    required int indexAction,
  }) : super(key: key);

  final String question;
  final Function(String) onAnswer;
  final String correctAnswer;
  final List<String> reponses;
  final TextEditingController textFieldController;
  final bool errorMessageVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text('Question : $question'),
          SizedBox(height: 20),
          TextField(
            controller: textFieldController,
            decoration: InputDecoration(
              hintText: 'Réponse',
              errorText:
                  errorMessageVisible ? 'Veuillez entrer une réponse.' : null,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onAnswer(textFieldController.text);
            },
            child: Text('Valider'),
          ),
          SizedBox(height: 20),
          Text('Réponses :'),
          Column(
            children: reponses.map((reponse) {
              return ListTile(
                title: Text(reponse),
                onTap: () {
                  textFieldController.text = reponse;
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
