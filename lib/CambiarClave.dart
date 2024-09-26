import 'package:flutter/material.dart';

class CambiarClave extends StatefulWidget {
  @override
  _CambiarClaveState createState() => _CambiarClaveState();
}

class _CambiarClaveState extends State<CambiarClave> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController _actualController = TextEditingController();
  final TextEditingController _nuevaController = TextEditingController();
  final TextEditingController _repetirNuevaController = TextEditingController();

  @override
  void dispose() {
    // Liberamos los controladores cuando la pantalla se destruye
    _actualController.dispose();
    _nuevaController.dispose();
    _repetirNuevaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Clave'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asociamos el formulario a la clave global
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo para la contraseña actual
              TextFormField(
                controller: _actualController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña Actual',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña actual';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo para la nueva contraseña
              TextFormField(
                controller: _nuevaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nueva Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la nueva contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo para repetir la nueva contraseña
              TextFormField(
                controller: _repetirNuevaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Repetir Nueva Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor repita la nueva contraseña';
                  }
                  if (value != _nuevaController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Botón para cambiar la contraseña
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Botón verde
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      // Aquí es donde implementarás la funcionalidad para cambiar la contraseña
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Procesando cambio de contraseña')),
                      );
                    }
                  },
                  child: Text(
                    'Cambiar Contraseña',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
