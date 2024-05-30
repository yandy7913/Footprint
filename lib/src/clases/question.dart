class Question {
  late String pregunta;
  String question = "pregunta:";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
  : pregunta = json['Pregunta'],
  answer = json['Respuesta'];

  void addOptions(List<String> newOptions) {
    question += pregunta;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
    
  }
}