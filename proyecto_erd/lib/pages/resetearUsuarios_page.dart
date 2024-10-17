import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetearUsuarioPage extends StatefulWidget {
  const ResetearUsuarioPage({super.key});

  @override
  State<ResetearUsuarioPage> createState() => _ResetearUsuarioPageState();
}

class _ResetearUsuarioPageState extends State<ResetearUsuarioPage> {
  TextEditingController _usernameController = TextEditingController();

  // Función para hacer la petición PUT a FastAPI
  Future<void> resetUser(String username) async {
    final url = Uri.parse('http://127.0.0.1:8000/reset-user/$username');
    try {
      final response = await http.put(url);
      if (response.statusCode == 200) {
        // Si el backend devuelve un código 200, el usuario fue reseteado correctamente
        final snackBar = SnackBar(content: Text('Usuario $username ha sido restablecido.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        // Si hay un error en la respuesta
        final snackBar = SnackBar(content: Text('Error al resetear usuario.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      // Manejar error en caso de fallo de la solicitud
      final snackBar = SnackBar(content: Text('Error de conexión.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text('Por favor ingrese el nombre de usuario del cliente que desea resetear'),
          SizedBox(height: 40.0),
          TextField(
            controller: _usernameController, // Controlador para obtener el valor del campo de texto
            decoration: InputDecoration(
              labelText: 'Usuario',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  if (username.isNotEmpty) {
                    // Llamar a la función resetUser cuando se presiona el botón
                    resetUser(username);
                  } else {
                    // Mostrar un mensaje si el campo está vacío
                    final snackBar = SnackBar(content: Text('Por favor ingrese un nombre de usuario.'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text('Resetear'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(173, 9, 32, 234),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Acción para el botón cancelar, si es necesario
                  _usernameController.clear();  // Limpia el campo de texto
                },
                child: Text('Cancelar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(12, 13, 9, 234),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
