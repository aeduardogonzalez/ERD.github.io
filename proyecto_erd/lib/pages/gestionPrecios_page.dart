import 'package:flutter/material.dart';

class GestionPreciosPage extends StatefulWidget {
  @override
  _GestionPreciosPage createState() => _GestionPreciosPage();
}

class _GestionPreciosPage extends State<GestionPreciosPage>{

  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _productoController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion de Precios'),
        backgroundColor: const Color.fromARGB(255, 9, 32, 234),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Por favor ingrese el código del producto para cambiar su precio'
              ),
            SizedBox(height: 16.0),
            TextField(
              controller: _codigoController,
              decoration: InputDecoration(
                labelText: 'Codigo',
                border: OutlineInputBorder(), 
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _productoController,
              decoration: InputDecoration(
                labelText: 'Producto',
                border: OutlineInputBorder(), 
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _precioController,
              decoration: InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(), 
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Guardar'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}