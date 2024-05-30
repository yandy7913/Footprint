import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maria/src/model/user.dart';

import 'package:maria/src/pages/perfil/edit_perfil_page.dart';
import 'package:maria/src/pages/perfil/number_widget.dart';
import 'package:maria/src/pages/perfil/profile_widget.dart';
import 'package:maria/src/users/user_preferences.dart';
import 'package:maria/themes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final icon = CupertinoIcons.moon_stars;
    final user = UserPreferences.getUser();


    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        leading: BackButton(),
        backgroundColor: Color.fromARGB(92, 0, 0, 0),
        elevation: 0,
        actions: [
          ThemeSwitcher (
            builder: (context) => IconButton(
              icon: Icon(icon),
            onPressed: () {
              final theme = isDarkMode ? Mythemes.lightTheme : Mythemes.darkTheme;

              final switcher = ThemeSwitcher.of(context) ;
              switcher.changeTheme(theme: theme);

              final newUser = user.copy(isDarkMode: !isDarkMode);
              UserPreferences.setUser(newUser);
            }, 
            
          ),
          ),
        ],
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => EditPerfilPage() )),
              );
              setState(() {
                
              });
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          NumberWidget(),
          const SizedBox(height: 24),
          buildAbout(user),
          const SizedBox(height: 24),
          
        ],
      ),
    
    
    );
 
 
 
 
 
  }

    Widget buildName(User user) => Column(
      children: [
        user.name.isNotEmpty
        ? Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
          :const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        
      ],
      );
      
      
      Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Sobre mí',
             style: GoogleFonts.acme(
             textStyle: Theme.of(context).textTheme.displayLarge,
             fontSize: 20,
             fontWeight: FontWeight.w500,
  ),
),	
          const SizedBox(height: 16),
          Text(
           user.about, 
           style: TextStyle(fontSize: 16, height: 1.4), 
          ),
        ],
        )
      );
     

}