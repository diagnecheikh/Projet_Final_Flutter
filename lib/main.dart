import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/screens/homeScreen.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:quiz/router.dart' as CustomRouter;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Question> questions = [
    Question(
      'Quelle est la capitale de la France ?',
      'Paris',
      ['Lyon', 'Marseille', 'Paris', 'Toulouse'],
    ),
    Question(
      'Quelle est la capitale de l\'Espagne ?',
      'Madrid',
      ['Madrid', 'Barcelone', 'Valence', 'Séville'],
    ),
    Question(
      'Quelle est la capitale de l\'Italie ?',
      'Rome',
      [
        'Milan',
        'Naples',
        'Turin',
        'Rome',
      ],
    ),
  ];

  final CustomRouter.CustomRouter router = CustomRouter.CustomRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageName.homePage,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) =>
              router.generateRoute(settings, questions: questions),
        );
      },
      routes: {
        PageName.homePage: (context) => HomeScreen(questions: questions),
      },
    );
  }
}

class PageName {
  static const String homePage = '/';
  static const String questionScreen = '/questionScreen';
}
