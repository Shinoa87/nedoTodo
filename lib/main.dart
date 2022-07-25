import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stajirovka2_todo_list/screens/loading_screen.dart';
import 'package:stajirovka2_todo_list/screens/my_todo_app.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontFamily: 'Avenir')
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
