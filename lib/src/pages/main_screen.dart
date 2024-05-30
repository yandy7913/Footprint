import 'package:flutter/material.dart';
import 'package:maria/src/pages/home_page.dart';
import 'package:maria/src/pages/perfil/perfil_page.dart';
import 'package:maria/src/pages/recomendaciones_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPages(currentIndex),
      bottomNavigationBar: crearBottomNavigationBar()
    );
  }
  
  _callPages( int paginaActual ) {
             
             switch( paginaActual) {
              case 0: return HomePage();
              case 1: return RecomenPage();
              case 2: return ProfilePage();

              default:
              return HomePage();
             }
          }
  
  crearBottomNavigationBar() {
    return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:('Home'),
            ),

              BottomNavigationBarItem(
                icon: Icon( Icons.assignment),
                label:('Recomendaciones'),
                backgroundColor: Color.fromARGB(45, 54, 98, 98),
            ),

              BottomNavigationBarItem(
                icon: Icon( Icons.account_circle),
                label:('Perfil'),
            ),
            ]
            
            );
  }
}