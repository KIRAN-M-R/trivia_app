import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/api_trivia.dart';
import 'package:trivia_app/model/questions.dart';
import 'dart:math';

import 'package:trivia_app/question_pageview.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  final ApiTrivia _apitrivia = ApiTrivia();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Trivia questions'),
      ),
      body: _futureWidget(),
    );
  }

  _futureWidget() {
    return FutureBuilder(
      future: _apitrivia.getStates(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List results = snapshot.data as List;

          return QuestionsPageView(
            results: results,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
