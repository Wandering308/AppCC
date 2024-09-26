import 'package:flutter/material.dart';

class Tiendas extends StatelessWidget {
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
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Título de la sección
            Text(
              'Tiendas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Cuadrícula de tiendas
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildStoreButton('assets/images/store1.png', 'Tienda 1'),
                  _buildStoreButton('assets/images/store2.png', 'Tienda 2'),
                  _buildStoreButton('assets/images/store3.png', 'Tienda 3'),
                  _buildStoreButton('assets/images/store4.png', 'Tienda 4'),
                  _buildStoreButton('assets/images/store5.png', 'Tienda 5'),
                  _buildStoreButton('assets/images/store6.png', 'Tienda 7'),
                  _buildStoreButton('assets/images/store6.png', 'Tienda 8'),
                  _buildStoreButton('assets/images/store6.png', 'Tienda 9'),
                  _buildStoreButton('assets/images/store6.png', 'Tienda 10'),
                  _buildStoreButton('assets/images/store6.png', 'Tienda 6'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para los botones de tiendas
  Widget _buildStoreButton(String imagePath, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
