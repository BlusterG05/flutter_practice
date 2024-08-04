import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'database_cuarto.dart';

class ProductosForm extends StatefulWidget {
  @override
  _ProductosFormState createState() => _ProductosFormState();
}

class _ProductosFormState extends State<ProductosForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();
  String? _categoria;

  late DatabaseCuarto _databaseCuarto;

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
  }

  void _addProducto() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> producto = {
        'nombre': _nombreProductoController.text,
        'descripcion': _descripcionController.text,
        'precio': double.parse(_precioController.text),
        'categoria': _categoria,
      };
      int id = await _databaseCuarto.insertProducto(producto);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Producto registrado exitosamente con ID: $id'),
          duration: Duration(seconds: 2),
        ),
      );

      // Limpiar los campos del formulario
      _nombreProductoController.clear();
      _descripcionController.clear();
      _precioController.clear();
      setState(() {
        _categoria = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Productos'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreProductoController,
                decoration: InputDecoration(
                  labelText: "Nombre del Producto",
                  prefixIcon: Icon(Icons.inventory),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el nombre del producto";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(
                  labelText: "Descripción",
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese una descripción";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(
                  labelText: "Precio",
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el precio";
                  }
                  if (double.tryParse(value) == null) {
                    return "Por favor ingrese un número válido";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Categoría",
                  prefixIcon: Icon(Icons.category),
                ),
                value: _categoria,
                onChanged: (String? newValue) {
                  setState(() {
                    _categoria = newValue;
                  });
                },
                items: <String>["Electrónica", "Ropa", "Alimentos", "Hogar"]
                    .map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor seleccione una categoría";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProducto,
                child: Text("Guardar Producto"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'menu_form');
                },
                child: Text("Volver al Menú"),
              )
            ],
          ),
        ),
      ),
    );
  }
}