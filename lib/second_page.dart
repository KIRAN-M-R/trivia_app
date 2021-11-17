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
          // return PageView.builder(
          //   //create a controller above build method
          //   itemCount: 10,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Question ${index + 1}',
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           Text('            '),
          //           Text(
          //             '${results.elementAt(index).question}',
          //             style: TextStyle(
          //               fontSize: 30,
          //               fontWeight: FontWeight.w400,
          //             ),
          //           ),
          //           _buttons(results, index),
          //         ],
          //       ),
          //     );
          //   },
          // );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

//   _buttons(results, index) {
//     List wrongright = [];
//     List wrong = results.elementAt(index).incorrect_answers;
//     List right = [results.elementAt(index).correct_answer];
//     wrongright = wrong + right;
// // wrongright.add(results.elementAt(index).correct_answer);
//     bool isChecked = false;
//
//     return Expanded(
//       child: ListView.builder(
//         itemCount: wrongright.length,
//         itemBuilder: (context, position) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('${wrongright.elementAt(position)}'),
//               tileColor: Colors.grey,
//               trailing: Checkbox(
//                   checkColor: Colors.red,
//                   value: isChecked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isChecked = !value!;
//                     });
//                   }),
//             ),
//           );
//         },
//       ),
//     ); //hoverColor: Colors.red[900]),
//
//     // value: isChecked,
//     // onChanged: (bool? value) {
//     // setState(() {
//     // isChecked = value!;
//
// //Text('${wrongright.elementAt(position)}'));
//   }
}

// _options(int a,results,index){
//   if (a==0){
//     return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).correct_answer}  '));
//   }else if(a == 1) {
//     return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[0]}  '));
//   }else if(a == 2) {
//     return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[1]}  '));
//   }else if(a == 3) {
//     return ElevatedButton(onPressed: (){}, child: Text('  ${results.elementAt(index).incorrect_answers[2]}  '));
//   }
//
// }
