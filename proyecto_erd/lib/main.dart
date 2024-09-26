import 'package:flutter/material.dart';
import 'package:proyecto_erd/pages/gestionUsuarios_page.dart';
import 'package:proyecto_erd/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestionUsuariosPage(),
    );
  }
}
