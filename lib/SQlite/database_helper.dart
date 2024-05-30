
import 'package:maria/JSON/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String databaseName = "auth.db";

  //Tables 
  String user = '''
    CREATE TABLE users (
    usrId INTEGER PRIMARY KEY AUTOINCREMENT,
    fullName TEXT,
    email TEXT,
    usrName TEXT UNIQUE,
    usrPassword TEXT
  )
  ''';

//Our connection is already
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async{
      await db.execute(user);
    });
  }

  //Function methods

//Authentication
  Future<bool> authenticate (Users usr) async {
    final Database db = await initDB();
    var result = await db.rawQuery("select * from users where usrName = '${usr.usrName}' AND usrPassword = '${usr.password}' ");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
//Register
 Future<int> createUser (Users usr) async {
  final Database db = await initDB() ;
  return db.insert("users", usr.toMap()) ;

}

//Get User
Future<Users?> getUser (String usrName) async {
  final Database db = await initDB();
  var res = await db.query("users" , where: "usrName= ?" , whereArgs: [usrName]);
  return res.isNotEmpty? Users.fromMap(res.first) : null;

}

}