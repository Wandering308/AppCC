import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importar Firestore
import 'MenuInicial.dart'; // Importamos el menú inicial

class LoginRegister extends StatefulWidget {
  final String tipoUsuario;

  const LoginRegister({super.key, required this.tipoUsuario});

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Instancia de Firestore
  bool isLogin = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botones para alternar entre ingresar y registrar
            ToggleButtons(
              borderRadius: BorderRadius.circular(30),
              isSelected: [isLogin, !isLogin],
              onPressed: (index) {
                setState(() {
                  isLogin = index == 0;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Ingresar'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Registrarse'),
                ),
              ],
            ),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Campo de Contraseña
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    obscureText: true,
                  ),
                  if (!isLogin) ...[
                    const SizedBox(height: 10),
                    // Campo de Repetir Contraseña
                    TextField(
                      controller: repeatPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Repetir contraseña',
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      obscureText: true,
                    ),
                  ],
                  const SizedBox(height: 20),
                  // Botón de ingresar/registrarse
                  ElevatedButton(
                    onPressed: () async {
                      if (isLogin) {
                        await _validateAndSignIn();
                      } else {
                        await _validateAndRegister();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      isLogin ? 'Ingresar' : 'Registrarse',
                      style: const TextStyle(fontSize: 18),
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

  // Método para validar y registrar un nuevo usuario
  Future<void> _validateAndRegister() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final repeatPassword = repeatPasswordController.text.trim();

    // Validaciones
    if (email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese un email válido')),
      );
      return;
    }

    if (password != repeatPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }

    try {
      // Crear usuario en Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guardar información adicional en Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'tipoUsuario': widget.tipoUsuario,
      });

      // Navegar al menú inicial después de registrarse
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuInicial()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrarse: $e')),
      );
    }
  }

  // Método para validar e iniciar sesión
  Future<void> _validateAndSignIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validaciones
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese un email válido')),
      );
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuInicial()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión: $e')),
      );
    }
  }
}
