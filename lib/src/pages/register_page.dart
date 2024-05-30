import 'package:flutter/material.dart';
import 'package:maria/JSON/users.dart';
import 'package:maria/SQlite/database_helper.dart';
import 'package:maria/src/pages/login_page.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPass = TextEditingController();
  final db = DatabaseHelper();

Signup() async  {
  var res  = await db.createUser(Users(fullName: fullName.text, email: email.text, usrName: usrName.text, password: password.text));
  if( res>0) {
    if(!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()));
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
            
          ), 
        ),

        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 0.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(150, 255, 255, 255),
            borderRadius: BorderRadius.circular(5.0),
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
               SizedBox( height: 60.0),
              _crearFullName(  ),
              SizedBox( height: 30.0),
              _crearEmail(  ),
              SizedBox( height: 30.0),
              _crearUsername(  ),
              SizedBox( height: 30.0),
              _crearPassword(  ),
              SizedBox( height: 30.0),
              _crearConfirmPassword(  ),
              SizedBox( height: 30.0),
              _crearBotonRegistrar(  ),
              SizedBox( height: 30.0),
              _crearRowText(  ),
              SizedBox( height: 30.0),
            ]  
          ),
        )
      ],
    )
  );
}


 Widget _crearFondo(){
   final fondoVerde = Container(
    height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
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

 Widget _crearFullName(){

     return Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       child: TextField(
        controller: fullName,
         keyboardType: TextInputType.name,
         textCapitalization: TextCapitalization.sentences,
         decoration: InputDecoration(
           icon: Icon(Icons.person, color: Color.fromARGB(255, 16, 43, 17)),
           hintText: '<NAME>',
           labelText: 'Full Name',
         ),
         onChanged: (value) => value,
       ),
     );

}

Widget _crearEmail(){

     return Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       child: TextField(
        controller: email,
         keyboardType: TextInputType.emailAddress,
         textCapitalization: TextCapitalization.sentences,
         decoration: InputDecoration(
           icon: Icon(Icons.alternate_email, color: Color.fromARGB(255, 16, 43, 17)),
           hintText: 'ejemplo@correo.com',
           labelText: 'Correo electrónico',
         ),
         onChanged: (value) => value,
       ),
     );

}

Widget _crearUsername(){

     return Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       child: TextField(
        controller: usrName,
         keyboardType: TextInputType.text,
         textCapitalization: TextCapitalization.sentences,
         decoration: InputDecoration(
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_clock_outlined, color: Color.fromARGB(255, 16, 43, 17)), 
            labelText: 'password',
          ),
          onChanged: (value) => (value),
        ),
      );
}


Widget _crearConfirmPassword() {

     return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: confirmPass,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_clock_outlined, color: Color.fromARGB(255, 16, 43, 17)), 
            labelText: 'Confirm password',
          ),
          onChanged: (value) => (value),
        ),
      );

}

  Widget _crearBotonRegistrar(  ) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 10)),
    onPressed: () {
      Signup();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
      child: Text("Registrar"),
    ),
  );
}

_crearRowText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('¿Ya tienes una cuenta?', style: TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 16, 43, 17))),
      TextButton(
        child: Text('Login'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
        },
      )
    ],
  );
}


}

