import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}


class _QuizState extends State<Quiz> {
  List <String> selectedAnswers = [];

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void selectedAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {

        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions';
    });
  }



  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions") {
      screenWidget =  Questions(onAnswerSelect: selectedAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(selectedAnswers: selectedAnswers, onRestart: restartQuiz,);
    }


    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(204, 115, 71, 225),
                Color.fromARGB(255, 96, 49, 162)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
