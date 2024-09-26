import 'package:flutter/material.dart';

class ConfiguracionNotificaciones extends StatefulWidget {
  @override
  _ConfiguracionNotificacionesState createState() => _ConfiguracionNotificacionesState();
}

class _ConfiguracionNotificacionesState extends State<ConfiguracionNotificaciones> {
  bool _notificacionesActivadas = false; // Variable para el estado del slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración de Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Activar Notificaciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Notificaciones'),
              value: _notificacionesActivadas,
              onChanged: (bool value) {
                setState(() {
                  _notificacionesActivadas = value;
                });
                // Aquí puedes agregar lógica adicional para manejar el cambio en las notificaciones
                // como guardar el estado en el almacenamiento local o hacer una llamada a una API
              },
            ),
          ],
        ),
      ),
    );
  }
}
