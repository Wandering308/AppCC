import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mapa extends StatelessWidget {
  // Coordenadas predeterminadas
  final double latitude;
  final double longitude;

  Mapa({this.latitude = 37.7749, this.longitude = -122.4194}); // Coordenadas de ejemplo (San Francisco)

  // Función para abrir Google Maps
  void _abrirMapa() async {
    final String googleMapsUrl = 'https://maps.app.goo.gl/9wfxdtjn7y5NwwKW9';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'No se pudo abrir Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _abrirMapa,
          child: Text('Abrir Google Maps'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF66BB6A).withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }
}
