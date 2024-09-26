import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_erd/Controllers/check_controller.dart';
import 'package:proyecto_erd/Controllers/calendar_controller.dart';
import 'package:proyecto_erd/Controllers/navbar_controller.dart';
import 'package:proyecto_erd/pages/gestionUsuarios_page.dart';
import 'package:proyecto_erd/pages/gestionPrecios_page.dart';
import 'package:proyecto_erd/pages/question_page.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckController()), // Provee el controlador del checklist
        ChangeNotifierProvider(create: (context) => NavbarController()), // Provee el controlador del navbar
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
        body: Consumer<NavbarController>(
          builder: (context, navbarController, child) {
            final List<Widget> pages = [
              _buildDashboardContent(context), // Página principal (dashboard)
              GestionPreciosPage(), // Página adicional 1
              GestionUsuariosPage(), // Página adicional 2
              QuestionPage(), // Página adicional 3
            ];
            return pages[navbarController.selectedIndex];
          },
        ),
        bottomNavigationBar: Consumer<NavbarController>(
          builder: (context, navbarController, child) {
            return BottomNavigationBar(
              currentIndex: navbarController.selectedIndex,
              onTap: navbarController.onTabTapped,
              selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Color para el ítem seleccionado
              unselectedItemColor: const Color.fromARGB(228, 158, 158, 158), // Color para ítems no seleccionados
              
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem( 
                  icon: Icon(Icons.business),
                  label: 'Precios',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Usuarios',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Ayuda',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Contenido de la página de Dashboard
  Widget _buildDashboardContent(BuildContext context) {
    return Column(
      children: [
        // Texto de bienvenida
        Text(
          'Bienvenido, $username!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),

        // Integración del CalendarView
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
    );
  }
}