import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserPreferences {
  static late SharedPreferences preferences;

  static const keyUser = "user";
  static const myUser = User (
     
     imagePath: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.fundacion-affinity.org%2Fperros-gatos-y-personas%2Ftengo-un-animal-de-compania%2Flos-8-sonidos-principales-del-perro&psig=AOvVaw2VA8p4mIq-iQ2kRRW7HDiJ&ust=1709232163004000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNCAqOLwt4QDFQAAAAAdAAAAABAD," ,
     name: "usuario",
     email: "usuario@gmail.com",
     about: "descripción",
     isDarkMode: false,
  );

    static Future init() async {
    preferences = await SharedPreferences.getInstance();

  }

  static Future<void> setUser(User user) async {
          final json = jsonEncode(user.toJson());

      await preferences.setString(keyUser, json);
  }

static User getUser () {
    final json = preferences.getString(keyUser);
    return json == null? myUser : User.fromJson(jsonDecode(json));
  }
  
}
