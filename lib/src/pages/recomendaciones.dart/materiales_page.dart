
import 'package:flutter/material.dart';

class MaterialesPage extends StatelessWidget {
  const MaterialesPage({super.key});

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
                child: const Center(child: Text("-Tome duchas cortas. Las bañeras requieren galones más de agua que una ducha de 5 a 10 minutos.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 241, 236, 236),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Utiliza la papelera como basura, no el retrete", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 247, 241, 241),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Remoja y enjabona todo de una vez, sin tener la llave abierta y sólo ábrela para el enjuague final.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 240, 235, 235),), ),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Revisar periódicamente las llaves de agua, cañerías y tuberías interiores y exteriores de la vivienda para evitar fugas.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 249, 249),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Utilizar sistemas de recolección de agua de lluvia para usarla posteriormente en instalaciones sanitarias, para regar plantas", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 247, 244, 244),),),),
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
        image: AssetImage('assets/fondo_habitos.gif'),
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