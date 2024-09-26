import 'package:flutter/material.dart';
import 'package:proyecto_erd/Controllers/calendar_controller.dart';

class PrincipalPage extends StatelessWidget {
  final String username;

  PrincipalPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERD Siesa Enterprise'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop(); // Lógica para cerrar sesión
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CalendarView(username: username), // Aquí incluimos el widget CalendarView
      ),
    );
  }
}
