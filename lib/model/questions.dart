class Results {
  String? question;
  String? correct_answer;
  // List<String?>? incorrect_answers;
  String? incorrect_answer1;
  String? incorrect_answer2;
  String? incorrect_answer3;
  Results(
      {this.question,
      this.correct_answer,
      this.incorrect_answer1,
      this.incorrect_answer2,
      this.incorrect_answer3});

  Results.fromJson(Map<String, dynamic> mapOfJson)
      : question = mapOfJson["question"],
        correct_answer = mapOfJson["correct_answer"],
        // incorrect_answers.forEach((element) => mapOfJson["incorrect_answers"].add(element));
        incorrect_answer1 = mapOfJson["incorrect_answers"][0],
        incorrect_answer2 = mapOfJson["incorrect_answers"][1],
        incorrect_answer3 = mapOfJson["incorrect_answers"][2];
}
