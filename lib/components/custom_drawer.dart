import 'package:flutter/material.dart';
import '../login_form.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 34, 34),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('lib/imagenes/logopuce.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'ADMINISTRACIÓN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'INICIO', Icons.home, 'menu_form'),
          _buildDrawerItem(context, 'DATOS EMPRESA', Icons.business, 'datos_empresa_form'),
          _buildDrawerItem(context, 'PRODUCTOS', Icons.inventory, 'productos_form'),
          _buildDrawerItem(context, 'CLIENTES', Icons.person, 'cliente_form'),
          _buildDrawerItem(context, 'ORDEN DE TRABAJO', Icons.work, 'purchase_order_form'),
          _buildDrawerItem(context, 'ENCUESTAS', Icons.poll, 'encuesta_form'),
          _buildDrawerItem(context, 'MAPA', Icons.map, 'mapa'),
          Divider(),
          _buildDrawerItem(context, 'CERRAR SESIÓN', Icons.logout, '', onTap: () {
            // Cerrar sesión y regresar al login
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginForm()),
              (Route<dynamic> route) => false
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, String route, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 43, 43, 44)),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap ?? () {
        // Cerrar el drawer antes de navegar
        Navigator.pop(context);
        // Navegar a la ruta especificada
        Navigator.pushNamed(context, route);
      },
    );
  }
}