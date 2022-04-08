import 'package:flutter/material.dart';
import 'package:get_chaty/ecrans/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Chaty',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignIn(),
    );
  }
}

