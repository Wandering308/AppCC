import 'package:flutter/material.dart';

class DetalleTienda extends StatelessWidget {
  final String tiendaNombre;

  DetalleTienda({required this.tiendaNombre});

  // Descripciones para cada tienda
  final Map<String, String> tiendaDescripciones = {
    'Tienda 1': 'Ofrece una amplia variedad de ropa para hombres y mujeres, desde moda casual hasta elegante.',
    'Tienda 2': 'Especialistas en calzado de alta calidad. Encuentra zapatos para toda ocasión.',
    'Tienda 3': 'Disfruta de la mejor experiencia en cine, con las últimas películas y la mejor tecnología de sonido.',
    'Tienda 4': 'Descubre una gran variedad de artículos de hogar y decoración para todos los estilos.',
    'Tienda 5': 'Tienda de juguetes y entretenimiento para todas las edades, desde clásicos hasta novedades.',
    'Tienda 6': 'Electrónica y gadgets modernos, desde celulares hasta accesorios de última generación.',
    'Tienda 7': 'Librería con una extensa colección de libros y revistas para todos los gustos.',
    'Tienda 8': 'Variedades y artículos de bazar con promociones y ofertas increíbles.',
    'Tienda 9': 'Artículos deportivos y ropa de entrenamiento para llevar tu actividad física al siguiente nivel.',
    'Tienda 10': 'Tiendas de belleza y cuidado personal, con las mejores marcas y productos.'
  };

  // Lista de imágenes promocionales
  final List<String> promoImages = [
    'assets/images/promo1.png',
    'assets/images/promo2.png',
    'assets/images/promo3.png',
    'assets/images/promo4.png',
  ];

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
                // Imagen grande (Logo) centrada
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Cambia esto a la imagen del logo que desees usar
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                // Descripción de la tienda
                Text(
                  tiendaDescripciones[tiendaNombre] ?? 'Descripción no disponible',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Banner grande
                Image.asset(
                  'assets/images/banner.png', // Cambia esto al banner que desees usar
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                // Grid de imágenes promocionales
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: _buildPromotionalButtons(),
                  ),
                ),
                SizedBox(height: 20),
                // Botón de contacto
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de contacto
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF66BB6A).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Contacto',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                // Botón de mapa
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de mapa
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF66BB6A).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Mapa',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Construye los botones de imágenes promocionales (con imágenes de assets)
  List<Widget> _buildPromotionalButtons() {
    return promoImages.map((imagePath) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),
        ),
        onPressed: () {
          // Lógica futura para este botón se añadirá más adelante
        },
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      );
    }).toList();
  }
}
