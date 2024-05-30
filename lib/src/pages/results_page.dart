import 'package:flutter/material.dart';
import 'package:maria/src/clases/calculator.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.calculator}) : super(key: key);

  final Calculator calculator;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Calculator>(
      create: (_) => calculator,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 241, 233),
        appBar: AppBar(
          title: Text(calculator.name),
          backgroundColor: Color.fromARGB(255, 23, 78, 18),
          elevation: 0,
        ),
        body: Center(
          child: Consumer<Calculator>(
            builder: (context, calculator, _) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Preguntas: ${calculator.questions.length}', style: Theme.of(context).textTheme.bodyText1),
                        Text('Correctas: ${calculator.percent}%', style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: calculator.questions.length,
                      itemBuilder: (_, index) {
                        return Card(
                          color: calculator.questions[index].correct ? Colors.green.shade200 : Colors.red.shade200,
                          child: ListTile(
                            leading: calculator.questions[index].correct
                                ? Icon(Icons.check, color: Colors.green.shade900)
                                : Icon(Icons.close, color: Colors.red.shade900),
                            title: Text(calculator.questions[index].question),
                            subtitle: Text(calculator.questions[index].selected),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}