import 'package:flutter/material.dart';
//import 'Projects/portfolie.dart';
//import 'Projects/dice.dart';
//import 'Projects/ball.dart';
import 'Projects/quizApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Random Quiz app',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}
