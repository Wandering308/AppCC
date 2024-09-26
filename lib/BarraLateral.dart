import 'package:flutter/material.dart';
import 'package:flutter_app_cc/ConfiguracionNotificaciones.dart'; // Importamos la nueva pantalla de Configuración de Notificaciones

class BarraLateral extends StatelessWidget {
  const BarraLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
            leading: const Icon(Icons.notifications),
            title: const Text('Configuración de Notificaciones'),
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
            leading: const Icon(Icons.lock),
            title: const Text('Cambiar Clave'),
            onTap: () {
              Navigator.pushNamed(context, '/cambiar_clave');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contacto Centro Comercial'),
            onTap: () {
              Navigator.pushNamed(context, '/contacto');
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel), // Icono de martillo legal
            title: const Text('Aviso Legal'),
            onTap: () {
              Navigator.pushNamed(context, '/aviso_legal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Cerrar Sesión'),
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
