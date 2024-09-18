import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username; // Se pasará el username del usuario que inició sesión

  DashboardPage({required this.username}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Lógica para cerrar sesión y regresar a la página de inicio de sesión
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Bienvenido, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Puedes agregar funcionalidades o navegar a otras páginas
                print('Botón 1 presionado');
              },
              child: Text('Opción 1'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Otra funcionalidad
                print('Botón 2 presionado');
              },
              child: Text('Opción 2'),
            ),
          ],
        ),
      ),
    );
  }
}
