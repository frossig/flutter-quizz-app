class QuizQuestion {
  const QuizQuestion (this.text, this.answers,);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    //shuffle cambia el array original por eso este metodo
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}