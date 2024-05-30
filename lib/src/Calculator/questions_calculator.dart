
import 'package:maria/src/Calculator/question.dart';

const List<Question> questions = [
  Question(
    question: '1: ¿De qué tamaño es tu apartamento?', 
    options:  [
      'Un cuarto',
      'Dos cuarto',
      'Tres cuartos',
      'Cuatro cuartos', 
      ], optionValue: {1: 5, 2: 10, 3: 15, 4: 20}),
      
      
        Question(
    question: '2: ¿Cuántas personas viven en tu apartamento?', 
    options:  [
      'Una',
      'Dos',
      'Más de tres', 
      ], optionValue: {1:5, 2: 10, 3: 15}),
      
        Question(
    question: '3: ¿Cuántas veces limpias semanalmente el apartamento?', 
    options:  [
      'Una vez a la semana',
      'Más de dos veces a la semana',
      'Todos los días de la semana', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '4: ¿Cuántos minutos demoras en ducharte?', 
    options:  [
      '5 minutos',
      '15 minutos',
      'más de 20 minutos', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '5: ¿Qué tipo de electrodomésticos utilizas en el apartamento o residencia?', 
    options:  [
      'Me gusta cocinar con la hornilla',
      'Utilizo el calentador y la hornilla',
      'Uso más de tres por lo general', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '6: ¿Qué método empleas para calentar el agua?', 
    options:  [
      'Me gusta bañarme con agua fría',
      'Solo uso la hornilla',
      'Uso hornilla o calentador', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '7: ¿Con qué frecuencia compras ropa para tu uso?', 
    options:  [
      'Muy pocas veces compro ropa',
      'Compro de vez en cuando',
      'Comprar es importante para mí', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '8: ¿Cuántas veces comsumes carne de vacuno o cordero?', 
    options:  [
      'Casi nunca',
      '1-2 días a la semana',
      '3-5 días a la semana', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '9: ¿Con qué frecuencia utilizas el transporte público?', 
    options:  [
      'Casi nunca',
      '1-2 días a la semana',
      '3-5 días a la semana', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      
        Question(
    question: '10: ¿Cuántos viajes en avión haces al año?', 
    options:  [
      'Ninguno',
      '1-2 viajes por año',
      '4-5 viajes por año', 
      ], optionValue: {1: 5, 2: 10, 3: 15}),
      

];