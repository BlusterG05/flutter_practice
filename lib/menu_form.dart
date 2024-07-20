import 'package:flutter/material.dart';

class MenuForm extends StatefulWidget {
  @override
  _MenuFormPageState createState() => _MenuFormPageState();
}

class _MenuFormPageState extends State<MenuForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu de Opciones'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('lib/imagenes/logopuce.png')),
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
                leading: const Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: const Text(
                  'INICIO',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: const Text(
                  'CLIENTES',
                  style: TextStyle(
                    color: Colors.black,
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
                  color: Colors.blue,
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
                  Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(
                  Icons.book_online,
                  color: Colors.blue,
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
                  color: Colors.blue,
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
      ),
    );
  }
}
