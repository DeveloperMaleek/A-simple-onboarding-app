import 'package:flutter/material.dart';
import 'package:login_app/app_database.dart';
import 'package:login_app/db_operations.dart';
import 'package:login_app/homepage.dart';
import 'package:login_app/login_page.dart';
import 'package:login_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.

  final db = await AppDatabase().initDb();
  var isLogged = await DBOperations(db).users();
  // if (isLogged.length > 0) {
  //   runApp(MaterialApp(home: (HomePage())));
  // } else {
  //   runApp(MaterialApp(
  //     home: LoginPage(title: "title"),
  //   ));

  runApp(MyApp());
}

  // final db = await AppDatabase().initDb();
  // DBOperations(db).insertRecord(
  //     "Malik", "Kolade", "malikademola", "malikademola36@gmail.com");
