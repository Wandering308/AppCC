import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Anuncios extends StatelessWidget {
  // Función para abrir enlaces
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncios'),
      ),
      body: SingleChildScrollView( // Para permitir el scroll
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botones con imágenes de empresas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(
                    context, 'assets/images/Nikelogo.png', 'Nike'),
                _buildImageButton(
                    context, 'assets/images/adidaslogo.png', 'Adidas'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(context,
                    'assets/images/burguerking.png', 'Burger King'),
                _buildImageButton(
                    context, 'assets/images/frisbylogo.png', 'Frisby'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(
                    context, 'assets/images/batalogo.png', 'Bata'),
                _buildImageButton(
                    context, 'assets/images/jumbo.png', 'Jumbo'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(
                    context, 'assets/images/Tottologo.png', 'Totto Colombia'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir los botones con imágenes
  Widget _buildImageButton(BuildContext context, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        // Lógica para abrir enlaces
        if (label == 'Nike') {
          _launchURL('https://www.nike.com');
        } else if (label == 'Adidas') {
          _launchURL('https://www.adidas.com');
        } else if (label == 'Burger King') {
          _launchURL('https://www.bk.com');
        } else if (label == 'Frisby') {
          _launchURL('https://www.frisby.com');
        } else if (label == 'Bata') {
          _launchURL('https://www.bata.com');
        } else if (label == 'Jumbo') {
          _launchURL('https://www.tiendasjumbo.co');
        } else if (label == 'Totto Colombia') {
          _launchURL('https://co.totto.com');
        }
      },
      child: Column(
        children: [
          Container(
            width: 150, // Tamaño más grande del botón
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
