class Question {
  const Question(
    this.title,
    this.correctAnswer,
    this.reponses,
  );

  final String title;
  final String correctAnswer;
  final List<String> reponses;

  get options => null;

  @override
  String toString() {
    return 'Question{question: $title, correctAnswer: $correctAnswer, reponses: $reponses}';
  }
}
