import 'package:flutter/material.dart';
import 'Tiendas.dart'; // Importamos la pantalla de Tiendas
import 'Mapa.dart'; // Importamos la pantalla de Mapa

class MenuInicial extends StatelessWidget {
  const MenuInicial({super.key});

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
          // Contenido de la pantalla
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Espacio para la barra de búsqueda y los demás widgets
                SizedBox(height: MediaQuery.of(context).padding.top),
                // Campo de búsqueda
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Buscar',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.7), // Corregido
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Título
                const Text(
                  'Ingresa a tus servicios',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
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
                    _buildMenuButton(context, 'Promociones', Icons.local_offer),
                    
                    const SizedBox(height: 10),
                    _buildMenuButton(context, 'Anuncios', Icons.announcement),
                    const SizedBox(height: 10),
                    _buildMenuButton(context, 'Mapa', Icons.map), // Llamada al botón de Mapa
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los botones de servicio
  Widget _buildServiceButton(BuildContext context, IconData icon, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB2DFDB).withOpacity(0.8), // Usando un color personalizado con opacidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        if (label == 'Tiendas') {
          // Navegar a la pantalla de Tiendas con animación
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Tiendas(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = const Offset(0.0, 1.0);
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
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black)),
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
              builder: (context) => const Mapa(latitude: 40.7128, longitude: -74.0060), // Coordenadas de ejemplo
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF66BB6A).withOpacity(0.8), // Usando un color personalizado con opacidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
