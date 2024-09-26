import 'package:flutter/material.dart';
import 'MenuInicial.dart'; // Importamos el menú inicial

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Campos para ingresar datos
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Campo de Email
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Campo de Contraseña
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  // Botón de ingresar
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para ingresar
                      print('Ingresando como Administrador...');
                      // Navegar al menú inicial
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuInicial()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
