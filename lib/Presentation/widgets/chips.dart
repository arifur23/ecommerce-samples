import 'package:flutter/material.dart';

class ActionChoiceExample extends StatefulWidget {
  final  List<String> options;

  const ActionChoiceExample({super.key, required this.options});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 1;

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*.06,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          Wrap(
            spacing: 4.0,
            runSpacing: 0.0,
            children: List<Widget>.generate(
                widget.options.length, // place the length of the array here
                    (int index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        _value = index;
                      });
                    },
                    child: Chip(
                      backgroundColor: _value == index ? Colors.green : Colors.black,
                        shape: const StadiumBorder(),
                        label: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                          ),
                            child: Text(widget.options[index], style: const TextStyle(color: Colors.white),)
                        )
                    ),
                  );
                }
            ).toList(),
          ),
        ],
      ),
    );
  }
}
