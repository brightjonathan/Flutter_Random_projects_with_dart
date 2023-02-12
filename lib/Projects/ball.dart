import 'dart:math';
import 'package:flutter/material.dart';

class BallApp extends StatelessWidget {
  const BallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: const Color.fromRGBO(3, 9, 72, 100),
      ),
      body: const Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int BallNumber = 1;

  //change ball functionality
  void changedicenumber() {
    setState(() {
      //created a random number between 1 and 6
      BallNumber = Random().nextInt(5) + 1;
    });
  }

  //Reset funcftionality
  void ResetImage() {
    setState(() {
      BallNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton.icon(
              onPressed: ResetImage,
              icon: const Icon(
                Icons.reset_tv_rounded,
                size: 35.0,
              ),
              label: const Text(
                'Reset',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: changedicenumber,
              child: Image.asset('images/ball$BallNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
