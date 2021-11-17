import 'package:flutter/material.dart';
import 'package:trivia_app/second_page.dart';

class ScorePage extends StatefulWidget {
  final List useranswerlist;
  final List correctanswerlist;
  const ScorePage(
      {Key? key, required this.useranswerlist, required this.correctanswerlist})
      : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int count = 0;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.correctanswerlist.length; i++) {
      if (widget.correctanswerlist.elementAt(i) ==
          widget.useranswerlist.elementAt(i)) {
        count++;
      }
    }
    count *= 10;
    total = widget.correctanswerlist.length * 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trivia questions'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
              Center(
                  child: Text("Score",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
              Center(
                child: Text('${count}/${total}',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 120,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Secondpage(),
                          ),
                        );
                      },
                      child: Text('RETAKE TEST',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontStyle: FontStyle.normal)))),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
