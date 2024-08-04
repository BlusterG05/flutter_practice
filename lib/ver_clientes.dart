import 'package:flutter/material.dart';
import 'package:collaguazo_examen/database_cuarto.dart';
import 'components/custom_drawer.dart';

class VerClientesForm extends StatelessWidget {
  const VerClientesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Clientes')),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseCuarto().getAllClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay clientes registrados.'));
          } else {
            final clientes = snapshot.data!;
            return ListView.builder(
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                final cliente = clientes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('${cliente['nombre']} ${cliente['apellido']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Correo: ${cliente['correo']}'),
                        Text('Teléfono: ${cliente['telefono']}'),
                        Text('Sexo: ${cliente['sexo']}'),
                        Text('Estado Civil: ${cliente['estado_civil']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        // Puedes agregar más acciones aquí
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}