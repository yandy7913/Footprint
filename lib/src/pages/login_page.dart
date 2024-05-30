import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/JSON/users.dart';
import 'package:maria/SQlite/database_helper.dart';
import 'package:maria/src/pages/main_screen.dart';
import 'package:maria/src/pages/register_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usrName = TextEditingController();
  final password = TextEditingController();

  var isLoginTrue = false;

  final db = DatabaseHelper();

  //Login method
  login() async {
    var res = await db.authenticate(Users(usrName: usrName.text, password: password.text));
    if (res == true){
      if(!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
    }else{
      setState(() {
        isLoginTrue = true;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget> [
            _crearFondo(),
            _loginForm(context),
        ],
      ),
     
    );
  }

Widget _loginForm( BuildContext context){
  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[

        SafeArea(
          child: Container(
            height: 100.0,
          ), 
        ),

        Container(
          width: size.width * 0.85,
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(150, 255, 255, 255),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0,
                
              )
              
            ]
          ),
          child: Column(
            children: <Widget>[
              Text(
                "MyEkoLife",
                style: GoogleFonts.abel(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 30,
                fontWeight: FontWeight.bold, ), 
              ),
               const SizedBox( height: 60.0),
              _crearUsername(  ),
              const SizedBox( height: 30.0),
              _crearPassword(  ),
              const SizedBox( height: 30.0),
              _crearBotonLogin(  ),
              const SizedBox( height: 30.0),
              _crearRowTitle(  ),
              const SizedBox( height: 30.0),
              _crearText(  ),
              const SizedBox( height: 30.0),
              
            ]  
          ),
        )
      ],
    )
  );
}

_crearRowTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Text('¿No tienes cuenta?', style: TextStyle(color: Colors.black, fontSize: 15.0),),
      
      TextButton(
        child: const Text('Registrate'),
        onPressed: () {
        Navigator.push(context ,MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      )
    ],
  );
}

 Widget _crearFondo(){
   final fondoVerde = Container(
    height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/login_page.png'),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter
          ),
        ),
   );

   return Stack(
      children: <Widget>[
        fondoVerde,
      ],
   );
 }

Widget _crearUsername(){

     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: TextField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          controller: usrName,
          decoration: const InputDecoration(
           icon: Icon(Icons.account_circle, color: Color.fromARGB(255, 16, 43, 17)),
           hintText: 'username',
           labelText: 'Username',
         ),
         
         onChanged: (value) => value,
       ),
       );
     

   }

Widget _crearPassword() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_clock_outlined, color: Color.fromARGB(255, 16, 43, 17)), 
            labelText: 'password',
          ),
          onChanged: (value) => (value),
        ),
      );
    }

  Widget _crearBotonLogin() {
    return Container(
      child: ElevatedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text("Login"),
        ),
        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 10)),
        onPressed: () {
          login();
        },
      ),
    );
  }


_crearText() {
  return 
  // ignore: dead_code
  isLoginTrue ? const Text('¿Username or password is incorrect', style: TextStyle(color: Color.fromARGB(255, 218, 2, 2), fontSize: 15.0)): const Text('Cuenta correcta', style: TextStyle(color: Colors.black, fontSize: 15.0),);
}

}