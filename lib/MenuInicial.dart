import 'package:flutter/material.dart';

class MenuInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Acción para abrir el menú de opciones
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Campo de búsqueda
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Título
            Text(
              'Ingresa a tus servicios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Cuadrícula de íconos de servicios
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildServiceButton(Icons.shopping_bag, 'Ingreso a apps'),
                  _buildServiceButton(Icons.computer, 'Computadora'),
                  _buildServiceButton(Icons.local_parking, 'Estacionamiento'),
                  _buildServiceButton(Icons.medical_services, 'Salud'),
                  _buildServiceButton(Icons.card_giftcard, 'Regalos'),
                  _buildServiceButton(Icons.calendar_today, 'Calendario'),
                  _buildServiceButton(Icons.shopping_cart, 'Carrito'),
                  _buildServiceButton(Icons.fastfood, 'Comida'),
                ],
              ),
            ),
            // Botones inferiores
            Column(
              children: [
                _buildMenuButton('Promociones', Icons.local_offer),
                SizedBox(height: 10),
                _buildMenuButton('Anuncios', Icons.announcement),
                SizedBox(height: 10),
                _buildMenuButton('Mapa', Icons.map),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para los botones de servicio
  Widget _buildServiceButton(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  // Widget para los botones del menú inferior
  Widget _buildMenuButton(String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        // Acción al presionar el botón
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
