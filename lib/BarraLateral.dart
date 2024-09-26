import 'package:flutter/material.dart';
import 'package:flutter_app_cc/ConfiguracionNotificaciones.dart'; // Importamos la nueva pantalla de Configuración de Notificaciones

class BarraLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú de Opciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Configuración de Notificaciones'),
            onTap: () {
              // Redirige a la pantalla de configuración de notificaciones
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfiguracionNotificaciones(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Cambiar Clave'),
            onTap: () {
              Navigator.pushNamed(context, '/cambiar_clave');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contacto Centro Comercial'),
            onTap: () {
              Navigator.pushNamed(context, '/contacto');
            },
          ),
          ListTile(
            leading: Icon(Icons.gavel), // Icono de martillo legal
            title: Text('Aviso Legal'),
            onTap: () {
              Navigator.pushNamed(context, '/aviso_legal');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pop(context);
              // Aquí puedes añadir lógica adicional para cerrar sesión
            },
            tileColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
