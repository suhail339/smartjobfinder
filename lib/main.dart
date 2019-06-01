import 'package:flutter/material.dart';

//Pages
import 'pages/dashboard.dart';
import 'pages/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}
