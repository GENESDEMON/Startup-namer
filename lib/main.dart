import 'package:flutter/material.dart';
import 'package:startup_namer/random_words.dart';


void main() {
  //avoids errors caused by flutter upgrade
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
//main is an entry point for the app
//runapp starts the framework

class MyApp extends StatefulWidget { //stateless widget makes the app a widget

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override //stateless widget must override build
  Widget build(BuildContext context) {
    //generates word pairs by moving the word generation code from MyApp _RandomWordsState
    return MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: RandomWords(),
    );
  }
}
