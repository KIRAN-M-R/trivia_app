import 'package:flutter/material.dart';
import 'package:trivia_app/api_trivia.dart';
import 'package:trivia_app/model/questions.dart';

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
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, position) {
              return Center(
                  child: Text('${results.elementAt(position).question}'));
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
