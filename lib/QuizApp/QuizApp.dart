import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Quizapp());
}

class Quizapp extends StatefulWidget {
  const Quizapp({Key? key}) : super(key: key);

  @override
  _QuizappState createState() => _QuizappState();
}

var user = "USER";

List questionList = [
  "What's your favourite sports?",
  "Do you like to wear good clothes?"
];

List answerList = [
  ["uyuyuyu", "ytyty", "gfgfg"],
  ["fefef", "grgrg", "rerer"]
];

class _QuizappState extends State<Quizapp> {
  var index = 0;
  var question = questionList[0];
  var answer = answerList[0];

  @override
  void submit() {
    setState(() {
      index += 1;
      question = questionList[index];
      answer = answerList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Row(
                children: [
                  Icon(Icons.filter_b_and_w_rounded),
                  SizedBox(width: 5),
                  Text("Personality Quiz")
                ],
              )),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Center(
                child: Text(
                  "WELCOME $user!",
                  style: GoogleFonts.titilliumWeb(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Text(
                "this quiz will help you understand your personlaity better. The purpose is to give you better insights about yourself therefore it is not meant to judge you.",
                style: GoogleFonts.titilliumWeb(fontSize: 13),
                softWrap: true,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  "Questions",
                  style: GoogleFonts.raleway(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "$question",
                style: GoogleFonts.titilliumWeb(fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  print("Ehh Wrong");
                },
                child: Text("${answer[0]}"),
              ),
              TextButton(
                onPressed: () {
                  print("Yuh Right");
                },
                child: Text("${answer[1]}"),
              ),
              TextButton(
                onPressed: () {
                  print("Ehh Wrong");
                },
                child: Text("${answer[2]}"),
              ),
              IconButton(
                  onPressed: () {
                    print(index);
                    submit();
                  },
                  icon: Icon(Icons.arrow_forward)),
            ]),
          )),
    );
  }
}
