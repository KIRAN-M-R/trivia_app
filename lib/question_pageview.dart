import 'package:flutter/material.dart';
import 'package:trivia_app/options.dart';
import 'package:trivia_app/question_pageview.dart';
import 'package:trivia_app/scorepage.dart';

typedef void OptionSelectedCallback(String option);

class QuestionsPageView extends StatefulWidget {
  final List results;

  QuestionsPageView({Key? key, required this.results}) : super(key: key);

  @override
  _QuestionsPageViewState createState() => _QuestionsPageViewState();
}

class _QuestionsPageViewState extends State<QuestionsPageView> {
  List<String> _userAnswerList = [];
  List<String> correctanswerlist = [];
  int currentPagePosition = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _userAnswerList.addAll(widget.results.map((e) => ""));
    correctanswerlist = [];
    for (int i = 0; i < widget.results.length; i++) {
      correctanswerlist.add(widget.results.elementAt(i).correct_answer);
    }

    // for(int i =0; i < widget.results.length; i++) {
    //   _userAnswerList.add("");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.results.length,
      onPageChanged: (newPagePosition) {
        currentPagePosition = newPagePosition;
      },
      itemBuilder: (context, index) {
        List wrongright = [];
        List wrong = widget.results.elementAt(index).incorrect_answers;
        List right = [widget.results.elementAt(index).correct_answer];

        wrongright = wrong + right;

        String userAnswer = _userAnswerList[index];
        int checkedOptionPosition = wrongright.indexOf(userAnswer);

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${index + 1}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.results.elementAt(index).question}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Options(
                wrongright: wrongright,
                selectedPosition: checkedOptionPosition,
                onOptionsSelected: (selectedOption) {
                  print("selected item is $selectedOption");
                  _userAnswerList[currentPagePosition] = selectedOption;
                  print(_userAnswerList.toList().toString());
                },
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScorePage(
                              useranswerlist: _userAnswerList,
                              correctanswerlist: correctanswerlist,
                            ),
                          ),
                        );
                      },
                      child: Text('SUBMIT'))),
              SizedBox(
                height: 60,
              )
            ],
          ),
        );
      },
    );
  }
}
