import 'package:flutter/material.dart';

class TransportePage extends StatelessWidget {
  const TransportePage({super.key});

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
                child: const Center(child: Text("-Planifica tu ruta. Averigua cuáles son las vías más cortas para ahorrar tiempo y combustible.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Elige autos que contaminan menos.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Usar un combustible bajo en carbón, como el etanol o el GNC.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Caminar, usar su bicicleta ó usar el transporte público más frecuentemente.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Realiza inspecciones de mantenimiento periódicas.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Incentivar la adquisición de vehículos híbridos y eléctricos.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),),
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
        image: AssetImage('assets/fondo_viaje.gif'),
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