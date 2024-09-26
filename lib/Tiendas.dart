import 'package:flutter/material.dart';
import 'DetalleTienda.dart'; // Importa el widget de la pantalla de detalle de la tienda

class Tiendas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido de la pantalla
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // Botón de regreso (AppBar)
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                // Título de la sección
                Text(
                  'Tiendas',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                // Cuadrícula de tiendas
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildStoreButton(context, 'assets/images/store1.png', 'Tienda 1'),
                      _buildStoreButton(context, 'assets/images/store2.png', 'Tienda 2'),
                      _buildStoreButton(context, 'assets/images/store3.png', 'Tienda 3'),
                      _buildStoreButton(context, 'assets/images/store4.png', 'Tienda 4'),
                      _buildStoreButton(context, 'assets/images/store5.png', 'Tienda 5'),
                      _buildStoreButton(context, 'assets/images/store6.png', 'Tienda 6'),
                      _buildStoreButton(context, 'assets/images/store7.png', 'Tienda 7'),
                      _buildStoreButton(context, 'assets/images/store8.png', 'Tienda 8'),
                      _buildStoreButton(context, 'assets/images/store9.png', 'Tienda 9'),
                      _buildStoreButton(context, 'assets/images/store10.png', 'Tienda 10'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para los botones de tiendas
  Widget _buildStoreButton(BuildContext context, String imagePath, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB2DFDB).withOpacity(0.8), // Usando color personalizado con opacidad
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        // Navegar a la pantalla de detalle de la tienda
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleTienda(tiendaNombre: label),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 50, color: Colors.red);
            },
          ),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
