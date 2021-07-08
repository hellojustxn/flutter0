import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // // add it to your class as a static member
  // static AudioCache player = AudioCache();
  // // or as a local variable
  // final player = AudioCache();

  // final player = AudioCache();
  // // call this method when desired
  // player.play('note1.wav');

  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Widget buildButton({Color color, int sound}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            foregroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: () {
          playSound(sound);
        },
        child: Text('Click me'),
      ),
    );
  }

  List<Widget> buildAll() {
    List<Widget> allButtons = [];
    List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
    int x = 1; // TODO: Convert this to map
    for (var c in colors) {
      allButtons.add(buildButton(color: c, sound: x));
      x++;
    }
    return allButtons;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildAll()),
        ),
      ),
    );
  }
}
