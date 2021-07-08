import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;

  roll() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          child: TextButton(
              onPressed: () {
                print("test pressed");
                roll();
              },
              child: Image.asset('images/dice$leftDiceNum.png')),
        ),
        Expanded(
          child: TextButton(
              onPressed: () {
                print("hello");
              },
              child: Image.asset('images/dice$rightDiceNum.png')),
        ),
      ]),
    );
  }
}