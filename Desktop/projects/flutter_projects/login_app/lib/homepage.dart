import 'package:flutter/material.dart';
import 'package:login_app/app_database.dart';
import 'package:login_app/db_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstName = "";

  @override
  void initState() {
    getFirstName();
    super.initState();
  }

  void getFirstName() async {
    // String firstName = "";
    var db = await AppDatabase().initDb();
    DBOperations(db).users().then((value) => {firstName = value[0].first_name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey There! $firstName"),
            ElevatedButton(
                onPressed: () async {
                  var db = await AppDatabase().initDb();
                  DBOperations(db).deleteRecord();
                  var isLogged =
                      await DBOperations(db).users().then((value) => {
                            if (value.length <= 0)
                              {Navigator.pushNamed(context, "/login")}
                          });
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
