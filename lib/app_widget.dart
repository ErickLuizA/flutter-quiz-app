import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queszz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFF3F3D56),
      ),
    );
  }
}
