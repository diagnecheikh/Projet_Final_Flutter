import 'package:quiz/models/question.dart';

class Quiz {
  const Quiz(
    this.titre,
    this.liste,
  );

  final String titre;
  final List<Question> liste;

  @override
  String toString() {
    return 'Quiz{question: $titre,  liste: $liste}';
  }
}
