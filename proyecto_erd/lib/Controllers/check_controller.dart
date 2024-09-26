import 'package:flutter/material.dart';

class CheckController extends ChangeNotifier {
  // Lista de tareas con su estado
  List<Map<String, dynamic>> _tasks = [
    {"title": "Cartera", "isChecked": false},
    {"title": "Inventario", "isChecked": false},
    {"title": "C x C", "isChecked": false},
    {"title": "C x P", "isChecked": false},
    {"title": "Activos Fijos", "isChecked": false},
    {"title": "Compras", "isChecked": false},
    {"title": "Ventas", "isChecked": false},
    {"title": "Contabilidad", "isChecked": false},
  ];

  // Obtener la lista de tareas
  List<Map<String, dynamic>> get tasks => _tasks;

  // Actualizar el estado de una tarea específica
  void toggleTask(int index, bool? value) {
    _tasks[index]['isChecked'] = value;
    notifyListeners(); // Notifica a los widgets que estén escuchando para redibujar
  }
}
