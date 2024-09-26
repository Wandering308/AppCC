import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importar Firebase Core
import 'LoginRegister.dart'; // Importar la pantalla LoginRegister
import 'LoginAdmin.dart'; // Importar la pantalla LoginAdmin

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegurarse de que los widgets estén inicializados
  await Firebase.initializeApp(); // Inicializar Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Usar ruta relativa
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen del logo
              Image.asset(
                'assets/logo.png', // Usar ruta relativa
                height: 150,
              ),
              const SizedBox(height: 30),
              // Texto de bienvenida
              const Text(
                'Bienvenido\nSeleccione el tipo de inicio de sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              // Botón para ingresar como Administrador
              ElevatedButton(
                onPressed: () {
                  // Navegación a la pantalla de inicio de sesión para Administrador
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginAdmin(), // Cambiado a LoginAdmin
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo naranja
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  minimumSize: const Size(200, 50), // Tamaño mínimo del botón
                ),
                child: const Text(
                  'Ingresar como Administrador',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20), // Espacio entre los botones
              // Botón para ingresar como Usuario
              ElevatedButton(
                onPressed: () {
                  // Navegación a la pantalla de inicio de sesión para Usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginRegister(tipoUsuario: 'Usuario'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo naranja
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  minimumSize: const Size(200, 50), // Tamaño mínimo del botón
                ),
                child: const Text(
                  'Ingresar como Usuario',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
