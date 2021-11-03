import 'package:flutter/cupertino.dart';
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
          return  PageView.builder(

             //create a controller above build method
            itemCount: 10,
            itemBuilder : (context, index) {
              return Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Question ${index + 1}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('            '),
                    Text('${results.elementAt(index).question}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                    // ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[0]}  ')),
                    // ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[1]}  ')),
                    // ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[2]}  ')),
                    // ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).correct_answer}  '))
                    _buttons(results,index),
                  ],
                ),
              );
            },
          );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

_buttons(results,index){
  return Column(children: [ ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[0]}  ')),
    ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[1]}  ')),
    ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[2]}  ')),
    ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).correct_answer}  '))],);

}

