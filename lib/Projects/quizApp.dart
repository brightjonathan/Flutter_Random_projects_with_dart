import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizMain extends StatelessWidget {
  const QuizMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  //list or array <> specify the data type of the list of icon
  List<Widget> ScoreKeeper = [];

  List<String> Question = [
    "Approximately one quarter of human bones are in the feet.",
    "The atomic number for lithium is 17",
    "Alliumphobia is a fear of garlic",
    "'A' is the most common letter used in the English language",
    "A lion's roar can be heard up to eight kilometres away",
    "Queen Elizabeth II is currently the second longest reigning British monarch",
    "The only letter not in the periodic table is the letter J",
    "An octopus has three hearts",
    "Thomas Edison discovered gravity",
    "There are 14 bones in a human foot",
    "Hot and cold water sound the same when poured.",
    "In the English language there is no word that rhymes with orange.",
    "When the two numbers on opposite sides of a dice are added together it always equals 7.",
    "Bananas are curved because they grow upwards towards the sun",
    "Spaghetto is the singular word for a piece of spaghetti"
  ];

  //List of the answers
  List<bool> answer = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    true,
    true,
    true,
    true
  ];

  //created a var for the number count
  int questionNumber = 0;

  //next questions options
  void nextQuestion() {
    if (questionNumber < Question.length - 1) {
      questionNumber++;
    }
  }

  //is finished
  bool isFinished() {
    if (questionNumber >= Question.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //reset functionality
  void reset() {
    questionNumber = 0;
  }

  //onpressed functionality
  void checkAnswer(bool userPickerAnswer) {
    //This is the correct answer for the question
    bool correctAnswer = answer[questionNumber];

    setState(() {
      if (isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: "You've reached the end of the quiz.",
        ).show();

        //reset the question
        reset();

        //empty the check icon
        ScoreKeeper = [];
      } else {
        if (correctAnswer == true) {
          ScoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          ScoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        //nextQuextion functionality
        nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Question[questionNumber],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
