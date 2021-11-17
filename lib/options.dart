import 'package:flutter/material.dart';
import 'package:trivia_app/question_pageview.dart';

class Options extends StatefulWidget {
  final List wrongright;
  final OptionSelectedCallback onOptionsSelected;
  final int selectedPosition;
  const Options({
    required this.wrongright,
    required this.onOptionsSelected,
    required this.selectedPosition,
  });

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedIndex = 99;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedPosition;
    print("positio here is $selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.wrongright.length,
        itemBuilder: (context, position) {
          return Card(
            margin: EdgeInsets.all(10),
            child: CheckboxListTile(
              title: Text('${widget.wrongright.elementAt(position)}'),
              value: selectedIndex == position,
              onChanged: (bool? newValue) {
                widget.onOptionsSelected(widget.wrongright.elementAt(position));
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
