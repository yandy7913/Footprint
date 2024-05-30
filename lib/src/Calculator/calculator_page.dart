import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/src/Calculator/options.dart';
import 'package:maria/src/Calculator/questions_calculator.dart';
import 'package:maria/src/Calculator/results.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int selectedAnswerIndex = 0;

  int questionIndex = 0;

  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    setState(() {});
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        int? valorQuestion = questions[questionIndex].optionValue[selectedAnswerIndex];
        score += valorQuestion!;
        questionIndex++;
        selectedAnswerIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 250, 230),
      body: Stack(children: <Widget>[
        _buttonForm(context),
      ]),
    );
  }

  _buttonForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Container(
        child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 19.0,
          ),
        ),
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 100.0),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 244, 244),
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromARGB(255, 23, 82, 32).withOpacity(.7),
                  blurRadius: 5.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                question.question,
                style: GoogleFonts.abel(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
                ),
                
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: question.options.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
                onPressed: () => pickAnswer(index + 1),
                child: Options(
                  currentIndex: index,
                  question: question.options[index],
                  isSelected: false,
                  selectedAnswerIndex: 0,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 250, 253, 252),
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0, 
                )
                
                );
          },
        ),
        SizedBox(height: 90.0),
        isLastQuestion
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                ),
                child: Text("Finish"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => ResultsScreen(
                            score: score,
                          )));
                },
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                ),
                child: Text("Next"),
                onPressed: selectedAnswerIndex != 0 ? goToNextQuestion : null,
              )
      ],
    ));
  }
}
