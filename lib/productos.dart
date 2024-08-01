import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';

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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí iría la lógica para guardar los productos
                    // Por ahora, solo navegaremos al formulario de login
                    Navigator.pushNamed(context, 'login_form');
                  }
                },
                child: Text("Guardar y Continuar"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navegar directamente al login sin guardar productos
                  Navigator.pushNamed(context, 'login_form');
                },
                child: Text("Omitir"),
              )
            ],
          ),
        ),
      ),
    );
  }
}