import 'package:flutter/material.dart';

class AlimentoPage extends StatelessWidget {
  const AlimentoPage({super.key});

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
                child: const Center(child: Text("-Lee el etiquetado de los alimentos, y prefiere los productos que contengan la menor cantidad de aditivos, de preferencia elige los que no contengan menos de 5 ingredientes.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Que la temperatura de conservación de los alimentos sea la adecuada.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Complementa tus comidas con alimentos frescos, prioriza el consumo de frutas y verduras.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),), ),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Que los alimentos no sean preparados mucho tiempo antes de ser consumidos o en grandes cantidades.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Menos bebidas endulzadas con azúcar, más agua.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Evitar productos que incluyan la grasa o nata de los lácteos (helados de crema, postres o quesos amarillos).", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Color.fromARGB(255, 247, 241, 241),),),),
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
        image: AssetImage('assets/fondo_alimento.gif'),
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