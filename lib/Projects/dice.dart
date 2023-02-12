import 'dart:math';
import 'package:flutter/material.dart';

class dice extends StatelessWidget {
  const dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dice Game'),
        backgroundColor: Colors.red,
      ),
      body: const DicePage(),
    );
  }
}

//dice page widget
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //left dice number
  int leftDiceNumber = 1;

  //right dice number
  int rightDiceNumber = 2;

  //right hand functionality
  void changedicenumber() {
    setState(() {
      //created a random number between 1 and 6
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: changedicenumber,
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: changedicenumber,
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
