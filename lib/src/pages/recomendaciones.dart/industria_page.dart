
import 'package:flutter/material.dart';

class IndustriaPage extends StatelessWidget {
  const IndustriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Stack(
        children: <Widget> [
          _crearFondo(),
          

          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
            children: <Widget>[
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Fabrica productos sin explotar los recursos naturales del planeta Tierra.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Optimiza los envases de tus productos.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Reduce su consumo de energía eléctrica para su producción.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Debes intentar ser más exigente con lo que te pones al invertir en menos prendas pero de alta calidad y consiguiendo las piezas básicas de tu guardarropa.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Calcula la huella ambiental.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Tratar de no incluir en los procesos industriales materia prima que contenga metales pesados, y otras parecidas.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
            ]
          )
        ]
        
      ),
     
    );
  }
  
 Widget _crearFondo(){
   final fondoVerde = Container(
    height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/fondo_fabrica.gif'),
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
}