import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/src/pages/recomendaciones.dart/agua_page.dart';
import 'package:maria/src/pages/recomendaciones.dart/alimento_page.dart';
import 'package:maria/src/pages/recomendaciones.dart/energia_page.dart';
import 'package:maria/src/pages/recomendaciones.dart/industria_page.dart';
import 'package:maria/src/pages/recomendaciones.dart/materiales_page.dart';
import 'package:maria/src/pages/recomendaciones.dart/transporte_page.dart';


class RecomenPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(),
          
          

          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 220.0),
              children: <Widget>[
                
                _botonesRedondeadosAgua(context),
                _botonesRedondeadosEnergia(context),
                _botonesRedondeadosAlimento(context),
                _botonesRedondeadosTransporte(context),
                _botonesRedondeadosIndustria(context),
                _botonesRedondeadosHabitos(context),
                
              ],
            
          )
        ],
      ),
    );
  }


Widget _crearFondo(){
   final fondoVerde = Container(
    height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/fondo_recom.png'),
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
  
  
  
  _botonesRedondeadosAgua(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(10, 3, 105, 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(10, 3, 105, 1),
              radius: 30.0,
              child: Icon(
                Icons.water_drop,
                color: Color.fromARGB(255, 247, 247, 248),
                size: 50.0,
              ),
            ),
            //Text(texto, style: TextStyle(color: color),

            TextButton(
              
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return AguaPage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                        'Agua',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }


 _botonesRedondeadosEnergia(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(224, 236, 47, 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(224, 236, 47, 1),
              radius: 30.0,
              child: Icon(
                Icons.power,
                color: Color.fromARGB(255, 243, 243, 240),
                size: 50.0,
              ),
            ),
          

            TextButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return EnergiaPage();
                });
                Navigator.push(context, route);
              },
              child:  Text(
                        'Energía',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }


 _botonesRedondeadosAlimento(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(177, 22, 22, 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(177, 22, 22, 1),
              radius: 30.0,
              child: Icon(
                Icons.fastfood,
                color: Color.fromARGB(255, 243, 242, 242),
                size: 50.0,
              ),
            ),
            //Text(texto, style: TextStyle(color: color),

            TextButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return AlimentoPage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                        'Alimento',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }

  
   _botonesRedondeadosTransporte(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(19, 88, 5, 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(19, 88, 5, 1),
              radius: 30.0,
              child: Icon(
                Icons.directions_bus,
                color: Color.fromARGB(255, 247, 248, 246),
                size: 50.0,
              ),
            ),
            //Text(texto, style: TextStyle(color: color),

            TextButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return TransportePage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                        'Transporte',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }


     _botonesRedondeadosIndustria(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(26, 4, 4, 0.932),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(26, 4, 4, 0.932),
              radius: 30.0,
              child: Icon(
                Icons.factory_outlined,
                color: Color.fromARGB(255, 245, 247, 245),
                size: 50.0,
              ),
            ),
            //Text(texto, style: TextStyle(color: color),

            TextButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return IndustriaPage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                        'Industrias',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }


     _botonesRedondeadosHabitos(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(78, 9, 87, 1),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(78, 9, 87, 1),
              radius: 30.0,
              child: Icon(
                Icons.hail,
                color: Color.fromARGB(255, 249, 250, 249),
                size: 50.0,
              ),
            ),
            //Text(texto, style: TextStyle(color: color),

            TextButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return MaterialesPage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                        'Materiales',
                         style: GoogleFonts.acme(
                         textStyle: Theme.of(context).textTheme.displayLarge,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Color.fromARGB(255, 250, 250, 250),
                       ),
              ),
            ),

            SizedBox(height: 5.0)
          ],
        ),
      ),
    );
  }

}