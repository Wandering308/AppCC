import 'package:flutter/material.dart';

class DetalleTienda extends StatelessWidget {
  final String tiendaNombre;

  DetalleTienda({super.key, required this.tiendaNombre});

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

  // Mapa de imágenes promocionales por tienda
  final Map<String, List<String>> tiendaPromoImages = {
    'Tienda 1': [
      'assets/images/banner.png',
      'assets/images/banner.png',
    ],
    'Tienda 2': [
      'assets/images/banner.png',
      'assets/images/banner.png',
    ],
    'Tienda 3': [
      'assets/images/banner.png',
      'assets/images/banner.png',
    ],
    // Agrega más listas de imágenes para otras tiendas...
  };

  // Mapa de logos por tienda
  final Map<String, String> tiendaLogos = {
    'Tienda 1': 'assets/images/logo.png',
    'Tienda 2': 'assets/images/logo.png',
    'Tienda 3': 'assets/images/logo.png',
    // Agrega más logos para otras tiendas...
  };

  // Mapa de banners por tienda
  final Map<String, String> tiendaBanners = {
    'Tienda 1': 'assets/images/banner.png',
    'Tienda 2': 'assets/images/banner.png',
    'Tienda 3': 'assets/images/banner.png',
    // Agrega más banners para otras tiendas...
  };

  @override
  Widget build(BuildContext context) {
    // Obtener las imágenes promocionales, logo y banner para la tienda seleccionada
    final List<String> promoImages = tiendaPromoImages[tiendaNombre] ?? [];
    final String logoPath = tiendaLogos[tiendaNombre] ?? 'assets/images/logo.png';
    final String bannerPath = tiendaBanners[tiendaNombre] ?? 'assets/images/banner.png';

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
          // Botón de regreso en la parte superior
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Contenido de la pantalla
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 60), // Espacio para el botón de regreso
                // Imagen del logo centrada
                Center(
                  child: Image.asset(
                    logoPath,
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                // Descripción de la tienda
                Text(
                  tiendaDescripciones[tiendaNombre] ?? 'Descripción no disponible',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Banner específico de la tienda
                Image.asset(
                  bannerPath,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                // Grid de imágenes promocionales
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: _buildPromotionalButtons(promoImages),
                  ),
                ),
                const SizedBox(height: 20),
                // Botón de contacto
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de contacto
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF66BB6A).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Text(
                    'Contacto',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                // Botón de mapa
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón de mapa
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF66BB6A).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Text(
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
  List<Widget> _buildPromotionalButtons(List<String> promoImages) {
    return promoImages.map((imagePath) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
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
