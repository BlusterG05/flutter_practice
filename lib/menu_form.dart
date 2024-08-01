import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'login_form.dart';  // Asegúrate de que esta importación sea correcta

class MenuForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Menu de Opciones'),
      drawer: CustomDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          _buildMenuOption(context, 'Datos Empresa', Icons.business, 'datos_empresa_form'),
          _buildMenuOption(context, 'Productos', Icons.inventory, 'productos_form'),
          _buildMenuOption(context, 'Clientes', Icons.person, 'cliente_form'),
          _buildMenuOption(context, 'Encuestas', Icons.poll, 'encuesta_form'),
          _buildMenuOption(context, 'Orden de Trabajo', Icons.work, 'purchase_order_form'),
          _buildMenuOption(context, 'Mapa', Icons.map, 'mapa'),
          _buildMenuOption(context, 'Cerrar Sesión', Icons.logout, 'logout', isLogout: true),
        ],
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, String title, IconData icon, String route, {bool isLogout = false}) {
    return InkWell(
      onTap: () {
        if (isLogout) {
          // Lógica para cerrar sesión
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginForm()),
            (Route<dynamic> route) => false
          );
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 65, 67, 71),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}