import 'package:flutter/cupertino.dart';
import 'package:maria/src/clases/question.dart';

class Calculator with ChangeNotifier {
  String name;
  List<Question> questions;
  int right = 0;
  Calculator({required this.name, required this.questions});
  double get percent => (right / questions.length) * 100;
}