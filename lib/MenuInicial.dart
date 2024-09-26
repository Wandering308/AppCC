import 'package:flutter/material.dart';
import 'Tiendas.dart'; // Importamos la pantalla de Tiendas

class MenuInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Cambiado a background.jpg
              fit: BoxFit.cover,
            ),
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
            // Cuadrícula de botones de servicios
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildServiceButton(context, Icons.shopping_bag, 'Tiendas'),
                  _buildServiceButton(context, Icons.computer, 'Computadora'),
                  _buildServiceButton(context, Icons.local_parking, 'Estacionamiento'),
                  _buildServiceButton(context, Icons.medical_services, 'Salud'),
                  _buildServiceButton(context, Icons.card_giftcard, 'Regalos'),
                  _buildServiceButton(context, Icons.calendar_today, 'Calendario'),
                  _buildServiceButton(context, Icons.shopping_cart, 'Carrito'),
                  _buildServiceButton(context, Icons.fastfood, 'Comida'),
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
  Widget _buildServiceButton(BuildContext context, IconData icon, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB2DFDB).withOpacity(0.8), // Usando un color personalizado con opacidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        if (label == 'Tiendas') {
          // Navegar a la pantalla de Tiendas con animación
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => Tiendas(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  // Widget para los botones del menú inferior
  Widget _buildMenuButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Mapa') {
          // Navegar a la pantalla del Mapa
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Mapa(latitude: 40.7128, longitude: -74.0060), // Coordenadas de ejemplo
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF66BB6A).withOpacity(0.8), // Usando un color personalizado con opacidad
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
