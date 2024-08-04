import 'package:flutter/material.dart';
import 'database_cuarto.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';

class VerProductosForm extends StatelessWidget {
  const VerProductosForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Lista de Productos'),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseCuarto().getAllProductos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos registrados.'));
          } else {
            final productos = snapshot.data!;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.inventory),
                    ),
                    title: Text(producto['nombre']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Descripción: ${producto['descripcion']}'),
                        Text('Precio: \$${producto['precio']}'),
                        Text('Categoría: ${producto['categoria']}'),
                      ],
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