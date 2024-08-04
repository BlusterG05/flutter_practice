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
          _buildSubMenu(context, 'PRODUCTOS', Icons.inventory, [
            _buildDrawerSubItem(context, 'Crear Producto', 'productos_form'),
            _buildDrawerSubItem(context, 'Ver Productos', 'ver_productos_form'),
          ]),
          _buildSubMenu(context, 'CLIENTES', Icons.person, [
            _buildDrawerSubItem(context, 'Crear Cliente', 'cliente_form'),
            _buildDrawerSubItem(context, 'Ver Clientes', 'ver_clientes_form'),
          ]),
          _buildSubMenu(context, 'ORDEN DE TRABAJO', Icons.work, [
            _buildDrawerSubItem(context, 'Crear Orden', 'crear_orden_form'),
            _buildDrawerSubItem(context, 'Ver Ordenes', 'ver_ordenes_form'),
          ]),
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

  Widget _buildSubMenu(BuildContext context, String title, IconData icon, List<Widget> subItems) {
    return ExpansionTile(
      leading: Icon(icon, color: Color.fromARGB(255, 43, 43, 44)),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: subItems,
    );
  }

  Widget _buildDrawerSubItem(BuildContext context, String title, String route) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        onTap: () {
          // Cerrar el drawer antes de navegar
          Navigator.pop(context);
          // Navegar a la ruta especificada
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}