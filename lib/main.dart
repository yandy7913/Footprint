import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:maria/src/Calculator/calculator_page.dart';
import 'package:maria/src/pages/home_page.dart';
import 'package:maria/src/pages/login_page.dart';
import 'package:maria/src/pages/perfil/edit_perfil_page.dart';
import 'package:maria/src/pages/perfil/perfil_page.dart';
import 'package:maria/src/pages/preguntas_page.dart';
import 'package:maria/src/pages/recomendaciones_page.dart';
import 'package:maria/src/pages/register_page.dart';
import 'package:maria/src/pages/splashScreen.dart';
import 'package:maria/src/users/user_preferences.dart';
import 'package:maria/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return ThemeProvider(
        initTheme: user.isDarkMode ? Mythemes.darkTheme : Mythemes.lightTheme,
        child: Builder(
            builder: (BuildContext context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: user.isDarkMode
                      ? Mythemes.darkTheme
                      : Mythemes.lightTheme,
                  title: 'Material App',
                  initialRoute: 'splashScreen',
                  routes: {
                    'login': (BuildContext context) => const LoginPage(),
                    'home': (BuildContext context) => const HomePage(),
                    'preguntas_page': (BuildContext context) =>
                        const PreguntasPage(),
                    'profile': (BuildContext context) => const ProfilePage(),
                    'edit_perfil': (BuildContext context) =>
                        const EditPerfilPage(),
                    'recomendaciones': (BuildContext context) => RecomenPage(),
                    'register': (BuildContext context) => RegisterPage(),
                    'splashScreen': (BuildContext context) =>
                        const SplashScreen(),
                    'calculator_page': (BuildContext context) =>
                        CalculatorPage(),
                  },
                )));
  }
}
