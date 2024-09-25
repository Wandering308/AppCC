import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
              SizedBox(height: 30),
              // Texto de bienvenida
              Text(
                'Bienvenido\nIngrese para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              // Botón de ingresar
              ElevatedButton(
                onPressed: () {
                  // Navegación a la nueva pantalla
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginRegister()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
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

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool isLogin = true; // Variable para alternar entre ingresar y registrar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
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
              children: [
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
            SizedBox(height: 20),
            // Campos para ingresar datos
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  if (!isLogin)
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                    ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    obscureText: true,
                  ),
                  if (!isLogin) ...[
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Repetir contraseña',
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      obscureText: true,
                    ),
                  ],
                  SizedBox(height: 20),
                  // Botón de ingresar/registrarse
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón de ingresar/registrar
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      isLogin ? 'Ingresar' : 'Registrarse',
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
