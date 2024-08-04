import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'login_form.dart';

class MenuForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Menu de Opciones'),
      drawer: CustomDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildMenuCard(context, 'Datos Empresa', Icons.business, 'datos_empresa_form'),
          _buildExpandableMenuCard(context, 'Productos', Icons.inventory, [
            {'title': 'Crear Producto', 'route': 'productos_form'},
            {'title': 'Ver Productos', 'route': 'ver_productos_form'},
          ]),
          _buildExpandableMenuCard(context, 'Clientes', Icons.person, [
            {'title': 'Crear Cliente', 'route': 'cliente_form'},
            {'title': 'Ver Clientes', 'route': 'ver_clientes_form'},
          ]),
          _buildMenuCard(context, 'Encuestas', Icons.poll, 'encuesta_form'),
          _buildExpandableMenuCard(context, 'Orden de Trabajo', Icons.work, [
            {'title': 'Crear Orden', 'route': 'purchase_order_form'},
            {'title': 'Ver Órdenes', 'route': 'ver_ordenes_form'},
          ]),
          _buildMenuCard(context, 'Mapa', Icons.map, 'mapa'),
          _buildMenuCard(context, 'Cerrar Sesión', Icons.logout, 'logout', isLogout: true),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, String route, {bool isLogout = false}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          if (isLogout) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginForm()),
              (Route<dynamic> route) => false
            );
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Theme.of(context).primaryColor),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableMenuCard(BuildContext context, String title, IconData icon, List<Map<String, String>> options) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: options.map((option) => ListTile(
          title: Text(option['title']!),
          onTap: () => Navigator.pushNamed(context, option['route']!),
        )).toList(),
      ),
    );
  }
}