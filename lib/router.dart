import 'package:flutter/material.dart';
import 'package:quiz/screens/homeScreen.dart';
import 'package:quiz/models/question.dart';

class CustomRouter {
  Widget generateRoute(RouteSettings settings, {List<Question>? questions}) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen(
          questions: questions!,
        );
      default:
        return Scaffold(body: Text('Route inconnue'));
    }
  }
}
