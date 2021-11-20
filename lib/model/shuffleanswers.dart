import 'package:trivia_app/question_pageview.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/second_page.dart';

import '../options.dart';

class ShuffleRight {
  final List result;
  final Randomise Shuffler;
  final List wrongRightList = [];

  ShuffleRight({required this.result, required this.Shuffler}) {
    wrongRightList.addAll(result.map((e) => []));
    for (int i = 0; i < result.length; i++) {
      List wrong = result.elementAt(i).incorrect_answers;
      List right = [result.elementAt(i).correct_answer];
      wrongRightList[i] = wrong + right;
      wrongRightList[i].shuffle();
    }
    Shuffler(wrongRightList);
  }
}
