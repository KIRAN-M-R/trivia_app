import 'package:flutter/material.dart';
import 'package:trivia_app/question_pageview.dart';
import 'package:trivia_app/model/shuffleanswers.dart';

class Options extends StatefulWidget {
  final List wrongRightList;
  final OptionSelectedCallback onOptionsSelected;
  final int selectedPosition;
  final int index;
  //List finalWrongrightlist = [];
  Options({
    required this.wrongRightList,
    required this.onOptionsSelected,
    required this.selectedPosition,
    required this.index,
  });

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedIndex = 99;

  @override
  void initState() {
    super.initState();
    // Shuffleright a = Shuffleright(
    //     Shuffler: (list) {
    //       widget.finalWrongrightlist = list;
    //     },
    //     wrongright: widget.wrongright);
    // a.mix();
    selectedIndex = widget.selectedPosition;
    print("positio here is $selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.wrongRightList[widget.index].length,
        itemBuilder: (context, position) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 6),
            child: CheckboxListTile(
              checkColor: Colors.blueGrey[800],
              activeColor: Colors.blueGrey[100],
              selectedTileColor: Colors.blueGrey[800],
              selected: selectedIndex == position,
              title: Text(
                  '${widget.wrongRightList[widget.index].elementAt(position)}'),
              value: selectedIndex == position,
              onChanged: (bool? newValue) {
                widget.onOptionsSelected(
                    widget.wrongRightList[widget.index].elementAt(position));
                setState(
                  () {
                    selectedIndex = position;
                    // widget.selectedPosition = position;
                  },
                );
              },
            ),
          );
        },
      ),
    );
    ;
  }
}
