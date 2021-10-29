import 'package:flutter/material.dart';
import 'package:trivia_app/model/questions.dart';
import 'package:trivia_app/api_trivia.dart';

class Extract {

  Future<List?> ExtractData() async {
    final ApiTrivia apitrivia = ApiTrivia();
    Future<List<Results>?> results = apitrivia.getStates();
    Future<List>? listq = results.question;
  }

  }
