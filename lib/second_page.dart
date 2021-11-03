import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/api_trivia.dart';
import 'package:trivia_app/model/questions.dart';
import 'dart:math';

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
  Random random = new Random();
  int a = random.nextInt(4);
  int b = a + 1;
  int c = a + 2;
  int d = a + 3;
  if (b == 4 && c == 5 && d== 6){
    b = 0;
    c = 1;
    d = 2;
  }else if (c == 4 && d== 5){
    c = 0;
    d = 1;
  }else if (d == 4){
    d = 0;
  }
  print(a);
  return Column(children:
  [_options(a,results,index),
    _options(b,results,index),
    _options(c,results,index),
    _options(d,results,index)],);

}

_options(int a,results,index){
  if (a==0){
    return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).correct_answer}  '));
  }else if(a == 1) {
    return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[0]}  '));
  }else if(a == 2) {
    return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[1]}  '));
  }else if(a == 3) {
    return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[2]}  '));
  }

}