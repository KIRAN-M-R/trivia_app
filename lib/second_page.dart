import 'package:flutter/material.dart';

import 'api_trivia.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
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
      future: getStates(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List stateList = snapshot.data as List;
          return ListView.builder(
            itemCount: stateList.length,
            itemBuilder: (context, position) {
              return Center(
                  child: Text('${stateList.elementAt(position).stateName}'));
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
