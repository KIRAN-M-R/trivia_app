import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final TextStyle subtitle = Theme.of(context).textTheme.subtitle1!;
    final TextStyle body = Theme.of(context).textTheme.bodyText1!;

    return PageView.builder(
      controller: _controller,
      itemCount: widget.results.length,
      onPageChanged: (newPagePosition) {
        currentPagePosition = newPagePosition;
      },
      pageSnapping: true,
      itemBuilder: (context, index) {
        List wrongright = [];
        List wrong = widget.results.elementAt(index).incorrect_answers;
        List right = [widget.results.elementAt(index).correct_answer];

        wrongright = wrong + right;

        String userAnswer = _userAnswerList[index];
        int checkedOptionPosition = wrongright.indexOf(userAnswer);

        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Question ${index + 1}',
                  style: GoogleFonts.oswald(
                      textStyle: subtitle, color: Colors.yellow[800]),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${widget.results.elementAt(index).question}',
                  style: GoogleFonts.lato(textStyle: body, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
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
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: Colors.blueGrey[800],
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScorePage(
                              useranswerlist: _userAnswerList,
                              correctanswerlist: correctanswerlist,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'SUBMIT',
                        style: GoogleFonts.lato(
                          textStyle: body,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
