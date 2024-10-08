import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_erd/Controllers/check_controller.dart';
import 'package:proyecto_erd/Controllers/calendar_controller.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckController()), // Provee el controlador del checklist
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('ERP Siesa Enterprise'),
          backgroundColor: Color(0xFFDCE9FD),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pop(); // Lógica para cerrar sesión
              },
            ),
          ],
          automaticallyImplyLeading: false, // Quitar la flecha de regresar
        ),
        backgroundColor: Color(0xFFDCE9FD),
        body: Column(
          children: [
            // Texto de bienvenida
            Text(
              'Bienvenido, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
             // Aquí se integra CalendarView
            SizedBox(
              height: 150, // Ajusta este valor según sea necesario
              child: CalendarView(),
            ),

            // Checklist
            Expanded(
              child: Consumer<CheckController>(
                builder: (context, checkController, child) {
                  return ListView.builder(
                    itemCount: checkController.tasks.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(checkController.tasks[index]["title"]),
                        value: checkController.tasks[index]["isChecked"],
                        onChanged: (value) {
                          checkController.toggleTask(index, value);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}