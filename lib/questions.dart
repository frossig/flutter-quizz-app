import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onAnswerSelect});

  final void Function(String answer) onAnswerSelect;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onAnswerSelect(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 237, 223, 252),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            //children espera un Widget, pero al mapear esta recibiendo un array,
            //el spreadOp se encarga de descomponerla en widgets individuales
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, (){
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
