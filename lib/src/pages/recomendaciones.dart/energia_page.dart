import 'package:flutter/material.dart';

class EnergiaPage extends StatelessWidget {
  const EnergiaPage({super.key});

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
                child: const Center(child: Text("-Ahorre electricidad conectando los electrodomésticos a una regleta de enchufes y apagándolos por completo cuando no los esté usando, incluida su computadora.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 243, 240, 240),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Reducir la utilización de aparatos eléctricos.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 241, 237, 237),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Apaga el ordenador cuando no lo estés usando.",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 253, 253),), ),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Descongela tu congelador periódicamente.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 250, 250),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Utiliza luces de bajo consumo.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 250, 245, 245),),),),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: const Center(child: Text("-Comprar electrodomésticos con buena calificación energética. Elige siempre electrodomésticos que te ayuden a ahorrar a la larga.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 243, 239, 239),),),),
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
        image: AssetImage('assets/fondo_luz.gif'),
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