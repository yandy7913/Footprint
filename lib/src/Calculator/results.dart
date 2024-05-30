import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/src/Calculator/calculator_page.dart';
import 'package:maria/src/pages/main_screen.dart';


class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 1000),
        Text(
          'Tus resultados:',
           style: GoogleFonts.poppins(
           textStyle: Theme.of(context).textTheme.displayLarge,
           fontSize: 35,
           fontWeight: FontWeight.w700,
           fontStyle: FontStyle.italic,
          ),
        ),

        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: widget.score / 10,
                  color: Color.fromARGB(255, 9, 92, 9),
                  backgroundColor: const Color.fromARGB(255, 255, 252, 252),
                )),
            Column(
              children: [
                Text(
                  widget.score.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                valorTexto(widget.score),
                ),
               
                
              ],
            )
          ],
        ),

Column(
  children: [
    InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => CalculatorPage()));
      },
      child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 211, 118, 12),
                radius: 35,
                child: Center(
                child: Icon(Icons.restart_alt_rounded, color: Color.fromARGB(255, 248, 245, 245)),
                ),
              ),
    ),
     SizedBox(height: 10),
       Text(
  'Play Again',
  style: GoogleFonts.acme(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
),
  ],
),
       
Column(
  children: [
    InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen()));
      },
      child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 211, 118, 12),
                radius: 35,
                child: Center(
                  child: Icon(Icons.home, color: Color.fromARGB(255, 248, 245, 245)),
              ),
              ),
    ),
     SizedBox(height: 10),
        Text(
  'Home',
  style: GoogleFonts.acme(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
),	
  ],
),	
      ],
      
    ),

      );
     }
  
  String valorTexto(int score) {
    if (score >= 0 && score <= 70) {
      return "Eres superhéroe del clima";
    } else if (score >= 75 && score < 140) {
      return "Eres amigo del clima";
    }else{
      return "Eres enemigo del clima";
    }
  }
}
