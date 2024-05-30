import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maria/src/clases/calculator.dart';
import 'package:maria/src/clases/question.dart';
import 'package:maria/src/pages/results_page.dart';

class PreguntasPage extends StatefulWidget {
  const PreguntasPage({super.key});

  @override
  State<PreguntasPage> createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {

  int totalQuestions = 5;
  int totalOptions = 5;
  int questionIndex = 0;
  int progressIndex = 0;
 Calculator calculator = Calculator(name: "Calculadora de huella de carbono", questions: []);

  
  
  Future<void> readJason() async {
    final String response = await rootBundle.loadString('assets/preguntas.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while(true) {
      optionList.shuffle();
      int answer = optionList[0];
      if(questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data [option]['Respuesta']);
      }
      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      calculator.questions.add(question);

      if( calculator.questions.length >= totalOptions) break;
    }
    
    
    
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    readJason();
    
  }
  
void _optionSelected( String selected) {
  calculator.questions[questionIndex].selected = selected;
  if ( selected == calculator.questions[questionIndex].answer) {
     calculator.questions[questionIndex].correct = true;
     calculator.right += 1;
  }

  progressIndex += 1;

  if (questionIndex < totalQuestions - 1){
    questionIndex +=1;
  } else {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) => _buildResultDialog(context)); 
      
  }
  setState(() {
    
  });
}
  
   Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultados', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Preguntas totales: $totalQuestions", style: Theme.of(context).textTheme.bodyText1),
          Text("Correctas: ${calculator.right}", style: Theme.of(context).textTheme.bodyText1),
          Text("Incorrectas: ${(totalQuestions - calculator.right)}", style: Theme.of(context).textTheme.bodyText1),
          Text("Porcentaje: ${calculator.percent}%", style: Theme.of(context).textTheme.bodyText1),
           
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(context,
             MaterialPageRoute(
              builder: ((context) => ResultsPage( calculator: calculator,)))
             );
          },
          child: Text('Ver resultados detallados'),
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 214, 184),
      appBar: AppBar(
        title: Text(calculator.name),
        backgroundColor: Color.fromARGB(255, 20, 63, 15),
        elevation: 0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                color: Color.fromARGB(255, 231, 108, 14),
                value: progressIndex/totalQuestions,
                minHeight: 20,
              )
              )
              ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 450 ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child:  calculator.questions.isNotEmpty ? Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: 
                      Text(calculator.questions[questionIndex].question,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
          
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: totalOptions,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                              leading: Text('${index + 1}', style: Theme.of(context).textTheme.bodyText1),
                              title: Text(
                                calculator.questions[questionIndex].options[index]
                              , style: Theme.of(context).textTheme.bodyText1),
                              onTap: () {
                                _optionSelected(calculator.questions[questionIndex].options[index]);
                              },
                            ),
                          );
                        }),
                    )
                  ],
                ),
              ): const CircularProgressIndicator(backgroundColor: Colors.white,)
            ),
          ),
          TextButton(
            onPressed: () {_optionSelected('Skipped');}, 
            child: Text('Siguiente', style: Theme.of(context).textTheme.bodyText1),
            )
        ],
      )
    );
  }

  
}

  
