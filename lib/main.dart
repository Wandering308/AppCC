import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importar Firebase Core
import 'LoginRegister.dart'; // Importar la pantalla LoginRegister

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
                'Bienvenido\nIngrese para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              // Botón de ingresar
              ElevatedButton(
                onPressed: () {
                  // Navegación a la nueva pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginRegister()),
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
      ),
    );
  }
}
