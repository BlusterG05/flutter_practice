import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';

class DatosEmpresaForm extends StatefulWidget {
  @override
  _DatosEmpresaFormState createState() => _DatosEmpresaFormState();
}

class _DatosEmpresaFormState extends State<DatosEmpresaForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Datos de la Empresa'),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://www.zarla.com/images/zarla-compu-space-1x1-2400x2400-20210603-9x3dmk6pq9jgdpm8rwh4.png'), // Reemplaza con tu URL de imagen
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Zenith Code',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Empresa de Desarrollo de Software',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                _buildInfoRow(Icons.location_on, 'Av. Chone Magisterio de la chone'),
                _buildInfoRow(Icons.phone, '+593 979923164'),
                _buildInfoRow(Icons.email, 'info@zenithcode.com'),
                _buildInfoRow(Icons.language, 'www.zenithcode.com'),
                SizedBox(height: 20),
                Text(
                  'Innovación en cada línea de código',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para navegar a la siguiente pantalla
                    Navigator.pushNamed(context, 'productos_form');
                  },
                  child: Text("Continuar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}