import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/src/Calculator/calculator_page.dart';
import 'package:maria/src/pages/preguntas_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _crearFondo(),
        _buttonForm(context),
      ]),
    );
  }

  _buttonForm(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

  return Container(
    child: Column(
      children: <Widget>[

        SafeArea(
          child: Container(
            height: 420.0,
          ), 
        ),

        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 60.0),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(223, 255, 255, 255),
            borderRadius: BorderRadius.circular(2.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0,
                
              )
              
            ]
          ),
          child: Column(
            children: <Widget>[
              SizedBox( height: 0.0),
              _crearBotonHuella(  ),
              SizedBox( height: 0.0),
              _crearBotonCalculator(  ),
            ],
          ),
        )
      ],
    )
  );
  }

  _crearBotonHuella() {
    return TextButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              child: Text(
                    "Preguntas de huella de carbono",	
                    style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    ),
                  ),
            ),
            style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 15)),
            onPressed: (() {
              final route = MaterialPageRoute(builder: (context) {
                return PreguntasPage();
              });
              Navigator.push(context, route);
            }));
      }

      _crearBotonCalculator() {
        return TextButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              child: Text(
                    "Calcula tú huella de carbono",	
                    style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    ),
                     ),
            ),
            style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 15)),
            onPressed: (() {
              final route = MaterialPageRoute(builder: (context) {
                return CalculatorPage();
              });
              Navigator.push(context, route);
            }));
      }
      
       
              
        }


Widget _crearFondo(){
   final fondoVerde = Container(
    height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/home.gif'),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      
          ),
        ),
   );

   return Stack(
      children: <Widget>[
        fondoVerde,
      ],
   );

 }

