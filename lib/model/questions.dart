class Results {
  String? question;
  String? correct_answer;
  List<dynamic> incorrect_answers;

  Results({this.question, this.correct_answer, required this.incorrect_answers});

  Results.fromJson(Map<String, dynamic> mapOfJson)
      : question = mapOfJson["question"],
        correct_answer = mapOfJson["correct_answer"],
        incorrect_answers = mapOfJson["incorrect_answers"];
}
