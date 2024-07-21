import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 34),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('lib/imagenes/logopuce.png')),
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
              )),
          ListTile(
              leading: const Icon(Icons.home, color: Color.fromARGB(255, 43, 43, 44)),
              title: const Text('INICIO',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, 'menu_form');
              }),
          ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 43, 43, 44),
              ),
              title: const Text(
                'CLIENTES',
                style: TextStyle(
                  color: Color.fromARGB(255, 43, 43, 44),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'cliente_form');
              }),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 43, 43, 44),
            ),
            title: const Text(
              'ORDEN DE TRABAJO',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'purchase_order_form');
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.book_online,
                color: Color.fromARGB(255, 43, 43, 44),
              ),
              title: const Text(
                'ENCUESTAS',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'encuesta_form');
              }),
          ListTile(
              leading: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 43, 43, 44),
              ),
              title: const Text(
                'CERRAR SESIÓN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
